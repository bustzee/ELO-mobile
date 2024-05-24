<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Livestream;
use App\Models\Role;
use App\Models\User;
use App\Models\Users;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\Log;

class UserController extends Controller
{

   // this function will list all the users
   public function index()
   {

      if (request()->ajax()) {

         $users = Users::has('roles', '=<', 0)->orderBy('created_at', 'desc')->get();

         return DataTables::of($users)
            ->addIndexColumn()

            ->addColumn('status', function ($q) {
               $status = '';
               if (auth()->user()->can('change-user-status')) {
                  $status = 'change-status';
               }

               if ($q->status == 1) {
                  $btn = '<a href="javascript:void(0)" data-id="' . $q->id . '"  data-username="' . $q->username . '"   data-account="deactive"   class="btn-sm btn-success  ' . $status . '" ><i class="fa fa-check"></i></a>';
                  return  $btn;
               } else {
                  $btn = '<a href="javascript:void(0)" data-id="' . $q->id . '"  data-username="' . $q->username . '"  data-account="active"   class="btn-sm btn-danger ' . $status . '" ><i class="fa fa-check"></i></a>';
                  return  $btn;
               }
            })
            ->addColumn('action', function ($row) {
               $rol = $row->roles->pluck('id');
               $json = json_encode($rol, JSON_UNESCAPED_UNICODE);
               $btn = '<div class="dropdown">';
               $btn .= '<button class="btn dropdown-toggle" type="button" data-toggle="dropdown"><span class="caret"></span></button>';
               $btn .= '<ul class="dropdown-menu">';
               if (auth()->user()->can('create-role')) {
                  $btn .= ' <li><a href="javascript:void(0)" data-roles="' .   $json . '" data-id="' . $row->id . '" class="anchor-link add-roles" >Add Roles</a></li>';
               }
               if (auth()->user()->can('create-livestream-watcher')) {
                  if ($row->can('view-livestream-watcher')) {
                     $btn .= ' <li><a href="javascript:void(0)" data-id="' . $row->id . '" data-livestrams="' . $row->startStream()->pluck('id') . '" data-id="' . $row->id . '" class="anchor-link add-livestream" >Add Livestreams</a></li>';
                  }
               }
               if (auth()->user()->can('delete-user')) {
                  // $btn .=' <li><a href="javascript:void(0)" data-id="'.$row->id.'" class="anchor-link live-delete" >Delete</a></li>';
               }
               $btn .= '</ul></div>';
               return $btn;
            })
            ->rawColumns(['action', 'username', 'email', 'firstName', 'lastName', 'phone', 'status'])
            ->make(true);
      }
      $livestreams = Livestream::whereNull('type')->where('status', 'started')->get();
      $roles = Role::get();
      return view('backend.users.index')->with(['roles' => $roles, 'livestreams' => $livestreams]);
   }



   public function UR_exists($url)
   {
      dd($url);
      $ch = curl_init($url);
      curl_setopt($ch, CURLOPT_NOBODY, true);
      curl_exec($ch);
      $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
      if ($code == 200) {
         $status = true;
      } else {
         $status = false;
      }
      curl_close($ch);
      return $status;
   }

   public function check123()
   {
      // http://config('app.ip_address')/{{ $livestream->stream_id }}.mp4
      $url = $this->UR_exists('http://' . config('app.ip_address') . '/988d909b1e6241f1a043234d1f4432ee.mp4');
      dd($url);
   }

   // this function will delete the users
   public function destroy(Request $request)
   {

      $id = $request->id;
      if ($id) {
         $user = Users::find($id);
         $user->delete();
         return response()->json(['success' => true], 200);
      }
      return response()->json(['success' => false], 404);
   }

   // this function will add the roles to the user
   public function addRoles(Request $request)
   {

      $user = Users::find($request->id);
      $user->roles()->sync($request->roles);
      $roles = Role::whereIn('id', $request->roles)->get();
      $array = [];
      foreach ($roles as $role) {
         array_push($array, $role->permissions->pluck('id'));
      }
      $user->permissions()->sync($array[0]);

      return response()->json(['success' => true], 200);
   }
   // this function will add the livestream to the users
   public function addLivestream(Request $request)
   {

      $user = Users::find($request->id);
      $stream = Livestream::whereIn('id', $request->livestream)->get();
      $user->canmonitor()->sync($stream->pluck('id')->toArray());
      return response()->json(['success' => true], 200);
   }
   // this function will change the status of the users
   public function changeStatus(Request $request)
   {
      $user = Users::find($request->id);
      if ($user->status == 1) {
         $status = 0;
      } else {
         $status = 1;
      }
      $user->update(['status' => $status]);
      return response()->json(['success' => true], 200);
   }

   // this function will lists all the admin users
   public function admin()
   {
      if (request()->ajax()) {

         $users = Users::has('roles', '>', 0)->orderBy('created_at', 'desc')->get();

         return DataTables::of($users)
            ->addIndexColumn()
            ->addColumn('roles', function ($q) {
               return $q->roles()->pluck('name')->implode(',');
            })
            ->addColumn('status', function ($q) {
               if ($q->status == 1) {
                  $btn = '<a href="javascript:void(0)" data-id="' . $q->id . '"  data-username="' . $q->username . '"   data-account="deactive"   class="btn-sm btn-success  change-status" ><i class="fa fa-check"></i></a>';
                  return  $btn;
               } else {
                  $btn = '<a href="javascript:void(0)" data-id="' . $q->id . '"  data-username="' . $q->username . '"   data-account="active"  class="btn-sm btn-danger  change-status" ><i class="fa fa-check"></i></a>';
                  return  $btn;
               }
            })
            ->addColumn('action', function ($row) {
               $rol = $row->roles->pluck('id');
               $json = json_encode($rol, JSON_UNESCAPED_UNICODE);
               $btn = '<div class="dropdown">';
               $btn .= '<button class="btn dropdown-toggle" type="button" data-toggle="dropdown"><span class="caret"></span></button>';
               $btn .= '<ul class="dropdown-menu">';
               if (auth()->user()->can('create-role')) {
                  $btn .= ' <li><a href="javascript:void(0)" data-roles="' .   $json . '" data-id="' . $row->id . '" class="anchor-link add-roles" >Add Roles</a></li>';
               }
               if (auth()->user()->can('create-livestream-watcher')) {
                  if ($row->can('view-livestream-watcher')) {
                     $btn .= ' <li><a href="javascript:void(0)" data-id="' . $row->id . '" data-livestrams="' . $row->startStream()->pluck('id') . '"  class="anchor-link add-livestream" >Add Livestreams</a></li>';
                  }
               }
               if (auth()->user()->can('delete-user')) {
                  // $btn .=' <li><a href="javascript:void(0)" data-id="'.$row->id.'" class="anchor-link live-delete" >Delete</a></li>';
               }
               $btn .= '</ul></div>';
               return $btn;
            })
            ->rawColumns(['action', 'username', 'email', 'firstName', 'lastName', 'phone', 'roles', 'status'])
            ->make(true);
      }
      $livestreams = Livestream::whereNull('type')->get();
      $roles = Role::get();
      return view('backend.users.admin')->with(['roles' => $roles, 'livestreams' => $livestreams]);
   }




   // API -


   public function getUsersList(Request $request)
   {
      try {
         // Retrieve all users
         $users = Users::has('roles', '=<', 0)->orderBy('created_at', 'desc')->get();

         // Return the data as JSON
         return response()->json([
            'status' => 'success',
            'users' => $users
         ]);
      } catch (\Exception $e) {
         // Log the error
         Log::error('Error fetching users list: ' . $e->getMessage());

         // Return an error response
         return response()->json([
            'status' => 'error',
            'message' => 'An error occurred while fetching users list.'
         ], 500);
      }
   }


   public function AssignRole(Request $request)
   {
      try {
         // Validate incoming request
         $request->validate([
            'user_id' => 'required|exists:users,id',
            'role_id' => 'required|exists:roles,id',
         ]);

         // Find the user and role
         $user = Users::findOrFail($request->user_id);
         $role = Role::findOrFail($request->role_id);

         // Assign role to user
         $user->roles()->sync([$role->id]);

         // Return success response
         return response()->json([
            'status' => 'success',
            'message' => 'Assign Role Successfully.'
         ], 200);
      } catch (\Exception $e) {
         // Log the error
         Log::error('Error assigning role to user: ' . $e->getMessage());

         // Return an error response
         return response()->json([
            'status' => 'error',
            'message' => 'An error occurred while assigning role to user.'
         ], 500);
      }
   }


   public function UpdateUserStatus(Request $request)
{
    try {
        // Extract userId from the request body
        $userId = $request->input('userId');

        // Find the user by ID
        $user = Users::findOrFail($userId);

        // Validate incoming request
        $request->validate([
            'status' => 'required|in:active,inactive',
        ]);

        // Update user status
        $user->update([
            'status' => $request->status === 'active' ? 1 : 0,
        ]);

        // Return success response
        return response()->json(
            [
                'status' => 'success',
                'message' => 'Status updated Successfully.'
            ],
            200
        );
    } catch (\Exception $e) {
        // Log the error
        Log::error('Error updating user status: ' . $e->getMessage());

        // Return an error response
        return response()->json([
            'status' => 'error',
            'message' => 'An error occurred while updating user status.'
        ], 500);
    }
}

   public function GetListOfAdminUsers()
   {
      try {
         // Get users who have roles assigned
         $users = Users::has('roles')->orderBy('created_at', 'desc')->get();

         // Filter users who have admin role
         $adminUsers = $users->filter(function ($user) {
            return $user->hasRole('admin');
         });

         // Return success response with admin users
         return response()->json(['status' => 'success', 'users' => $adminUsers], 200);
      } catch (\Exception $e) {
         // Log the error
         Log::error('Error fetching admin users: ' . $e->getMessage());

         // Return an error response
         return response()->json(['status' => 'error', 'message' => 'An error occurred while fetching admin users.'], 500);
      }
   }
}
