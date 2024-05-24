<?php

namespace App\Http\Controllers\API;

use Carbon\Carbon;
use App\Models\Chat;
use App\Models\Users;
use App\Models\Livestream;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use PHPOpenSourceSaver\JWTAuth\Facades\JWTAuth;
use App\Models\UserBankDetail;
class AuthController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['GetUserDetails', 'CreateUser']]);
    }

  public function GetUserDetails(Request $request)
{
    try {
        // Validate the request
        $validator = Validator::make($request->all(), [
            'username' => 'required|string',
            'password' => 'required|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'error' => 'Validation Error',
                'message' => $validator->errors(),
            ], 422);
        }

        // Attempt to authenticate the user
        if (!$token = Auth::attempt($validator->validated())) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        // Retrieve the authenticated user
        $user = Auth::user();

        // Generate a JWT token for the user
        $token = JWTAuth::fromUser($user, ['exp' => now()->addHours(12)->timestamp]);

        // Fetch the user's bank details
        $userBankDetail = UserBankDetail::where('user_id', $user->id)->first();

        // Structure the response data
        $responseData = [
            'user' => $user,
            'token' => $token,
            'token_type' => 'bearer',
        ];

        // If user bank details exist, add them to the response data
        if ($userBankDetail) {
            $responseData['bank_details'] = $userBankDetail;
        }

        // Return the response
        return response()->json([
            'status' => 'success',
            'data' => $responseData,
            'message' => 'User logged in successfully.',
        ], 200);
    } catch (\Exception $e) {
        Log::error('Error in GetUserDetails: ' . $e->getMessage());

        return response()->json([
            'status' => 'error',
            'data' => null,
            'message' => 'An error occurred while processing your request. Please try again later.',
        ], 500);
    }
}


    public function CreateUser(Request $request)
    {
        try {
            $userExists = Users::where('email', $request->email)
                ->orWhere('username', $request->username)
                ->first();

            if ($userExists === null) {
                $request->validate([
                    'email' => 'required|email|unique:users',
                    'firstname' => 'required|alpha',
                    'lastname' => 'required|alpha',
                    'username' => 'required|unique:users',
                    'password' => 'required',
                ]);

                $imageName = "avatar.jpg";
                // if ($request->hasFile('profile')) {
                //     $request->validate(['profile' => 'required|image|mimes:jpeg,png,jpg,gif,svg']);
                //     $imageName = time() . '.' . $request->profile->extension();
                //     $path = $request->profile->move(public_path('images'), $imageName);
                // }
                
             if ($request->has('profile') && strpos($request->profile, 'data:image') === 0) {
                $imageData = base64_decode(preg_replace('#^data:image/\w+;base64,#i', '', $request->profile));
                $imageName = time() . '.png'; // Assuming PNG format, you may need to adjust this based on the actual image type
                $path = public_path('images/' . $imageName);
                file_put_contents($path, $imageData);
            }
                
          $dateOfBirth = Carbon::parse($request->date_of_birth);
         if ($dateOfBirth->isFuture()) {
         return response()->json([
        'status' => 'error',
        'message' => 'The date of birth cannot be in the future.',
        'errors' => [
            'date_of_birth' => 'The date of birth cannot be in the future.'
        ]
     ], 422);
   }

            // Calculate age
              $userAge = $dateOfBirth->age;

                $user = new Users();
                $user->email = $request->email;
                $user->firstName = $request->firstname;
                $user->lastName = $request->lastname;
                $user->username = $request->username;
                $user->phone = $request->phone;
                $user->business_info = $request->business_info;
                $user->address = $request->address;
                $user->profile = $imageName;
                $user->stream_key = Str::replace("-", "", Str::orderedUuid());
                $user->password = Hash::make($request->password);
                $user->user_age = $userAge;
                $user->date_of_birth = $request->date_of_birth;
                $user->agree = $request->agree; 
                $user->save();

                Auth::login($user);

                return response()->json([
                    'status' => 'success',
                    'data' => [
                        'user' => $user,
                    ],
                    'message' => 'User registered successfully.',
                ], 201);
            } else {
                return response()->json([
                    'status' => 'error',
                    'data' => null,
                    'message' => 'User already exists with the provided email or username.',
                ], 400);
            }
        } catch (\Exception $exception) {

            Log::error('[' . now() . '] ' . $exception->getMessage());

            return response()->json([
                'status' => 'error',
                'data' => null,
                'message' => 'An error occurred while processing your request. Please try again later.',
            ], 500);
        }
    }

public function logout()
{
    try {
        Auth::logout();
        return response()->json([
            'status' => 'success',
            'message' => 'Successfully logged out',
        ], 200);
    } catch (\Exception $exception) {
        Log::error('[' . now() . '] ' . $exception->getMessage());
        return response()->json([
            'status' => 'error',
            'message' => 'An error occurred while logging out. Please try again later.',
        ], 500);
    }
}





    public function refresh()
    {
        return response()->json([
            'user' => Auth::user(),
            'authorisation' => [
                'token' => Auth::refresh(),
                'type' => 'bearer',
            ]
        ]);
    }


    public function getDashboardInfo()
    {
        try {
            // Retrieve dashboard information
            $users = Users::count();
            $livestreams = Livestream::query();
            $start = Livestream::whereNull('type')->whereIn('status', ['created', 'started'])->count();
            $stop = Livestream::whereNull('type')->where('status', 'stopped')->count();
            $chat = Chat::distinct('user_id')->count();

            // Return the data as JSON
            return response()->json([
                'status' => 'success',
                'users' => $users,
                'start' => $start,
                'stop' => $stop,
                'chat' => $chat
            ]);
        } catch (\Exception $e) {
            // Log the error
            Log::error('Error fetching dashboard info: ' . $e->getMessage());
            
            // Return an error response
            return response()->json([
                'status' => 'error',
                'message' => 'An error occurred while fetching dashboard information.'
            ], 500);
        }
    }
}
