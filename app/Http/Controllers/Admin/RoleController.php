<?php

namespace App\Http\Controllers\Admin;

use App\Models\Role;
use App\Models\Permission;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class RoleController extends Controller
{
    
    // this function will fetch all the roes 
    public function index(){
        if (request()->ajax()) {
           
             
            $livestreams = Role::orderBy('created_at','desc')->get();
            return DataTables::of($livestreams)
            ->addIndexColumn()
                 
                 ->addColumn('action',function($row){
                    $btn = '';
                   if(auth()->user()->can('edit-role')){
                    $btn .='<a href="'.url('edit-role/'.$row->id).'"  class="btn btn-xs btn-info" title="Edit"><i class="fas fa-pencil-alt "></i></a>';
                   }
                   if(auth()->user()->can('delete-role')){
                   $btn .=' <a href="javascript:void(0)" data-id="'.$row->id.'" data-name="'.$row->name.'" class="btn btn-xs btn-danger delete-role" title="Delete"> <i class="fa fa-trash"></i></a>';
                   }
                 $btn .='</ul></div>';
                   return $btn;
                 })
                 ->rawColumns(['action','name','slug'])
                 ->make(true);
         }
         return view('backend.roles.index');
    }
    // this function will display the form to create the roles
    public function create()
    {
        $permissions = Permission::get();
        return view('backend.roles.create')->with('permissions',$permissions);
    }

    // this function will save the roles
    public function store(Request $request){

        $data =[
            'name'=>'required|unique:roles,name',
            "permissions"    => "required|array|min:1",
            "permissions.*"  => "required|string|distinct|min:1",
           
        ];
         $validation =    Validator::make($request->all(),$data);
      
        if($validation->fails()) {
            return redirect()->back()->withErrors($validation);
        }
        $permissions = $request->permissions;
        $data = $request->except('_token','permissions');
        $role = Role::create($data);
        $role->permissions()->sync($permissions);
        return redirect()->to('/roles');
    }
    // this function will fetcht the roles for edit 
    public function edit($id){
        $role = Role::find($id);
      
        $permissions = Permission::get();
        return view('backend.roles.edit')->with([
            'permissions'=>$permissions,
            'role'=>$role
        ]);
    }


    public function showPermission(Request $request)
{
    try {
        // Fetch permissions
        $permissions = Permission::get();

        // Return success response with permissions
        return response()->json(['status' => 'success', 'permissions' => $permissions], 200);
    } catch (\Exception $e) {
        // Log the error
        Log::error('Error fetching permissions: ' . $e->getMessage());

        // Return error response
        return response()->json(['status' => 'error', 'message' => 'An error occurred while fetching permissions.'], 500);
    }
}

public function getAllRoles()
{
    try {
        // Fetch all roles ordered by creation date
        $roles = Role::orderBy('created_at', 'desc')->get();

        // Return success response
        return response()->json([
            'status' => 'success',
            'data' => $roles
        ], 200);
    } catch (\Exception $e) {
        // Log the error
        Log::error('Error fetching roles: ' . $e->getMessage());

        // Return error response
        return response()->json([
            'status' => 'error',
            'message' => 'Failed to fetch roles.',
        ], 500);
    }
}

public function CreateRole(Request $request)
{
    try {
        // Define validation rules
        $data = [
            'name' => 'required|unique:roles,name',
            'permissions' => 'required|array|min:1',
            'permissions.*' => 'required|string|distinct|min:1',
        ];

        // Validate the request data
        $validation = Validator::make($request->all(), $data);

        if ($validation->fails()) {
            // Return error response if validation fails
            return response()->json(['status' => 'error', 'message' => $validation->errors()], 422);
        }

        // Extract permissions and other data from the request
        $permissions = $request->permissions;
        $roleData = $request->except('_token', 'permissions');

        // Create the role
        $role = Role::create($roleData);

        // Sync permissions to the role
        $role->permissions()->sync($permissions);

        // Update slug name
        $role->update(['slug' => Str::slug($roleData['name'])]);

        // Return success response
        return response()->json(['status' => 'success', 'message' => 'Role created successfully'], 201);
    } catch (\Exception $e) {
        // Log the error
        Log::error('Error creating role: ' . $e->getMessage());

        // Return error response
        return response()->json(['status' => 'error', 'message' => 'An error occurred while creating the role.'], 500);
    }
}


public function UpdateRole(Request $request)
{
    try {
        // Extract id from the request body
        $id = $request->input('id');

        // Define validation rules
        $data = [
            'name' => 'required|unique:roles,name,' . $id,
            'permissions' => 'required|array|min:1',
            'permissions.*' => 'required|string|distinct|min:1',
        ];

        // Validate the request data
        $validation = Validator::make($request->all(), $data);

        if ($validation->fails()) {
            // Return error response if validation fails
            return response()->json(['status' => 'error', 'message' => $validation->errors()], 422);
        }

        // Find the role by ID
        $role = Role::find($id);

        if (!$role) {
            // Return error response if role not found
            return response()->json(['status' => 'error', 'message' => 'Role not found.'], 404);
        }

        // Update role name
        $role->update(['name' => $request->name, 'slug' => Str::slug($request->name)]);

        // Sync permissions to the role
        $permissions = $request->permissions;
        $role->permissions()->sync($permissions);

        // Return success response
        return response()->json(['status' => 'success', 'message' => 'Role updated successfully'], 200);
    } catch (\Exception $e) {
        // Log the error
        Log::error('Error updating role: ' . $e->getMessage());

        // Return error response
        return response()->json(['status' => 'error', 'message' => 'An error occurred while updating the role.'], 500);
    }
}


public function DeleteRole(Request $request)
{
    try {
        // Get the role ID from the request
        $id = $request->id;

        // Find the role by ID
        $role = Role::find($id);

        // Check if the role exists
        if ($role) {
            // Detach the role's permissions from associated users
            $rolePermissions = $role->permissions->pluck('id')->toArray();
            if ($role->users) {
                foreach ($role->users as $user) {
                    $user->permissions()->detach($rolePermissions);
                }
            }

            // Detach all permissions from the role
            $role->permissions()->detach();

            // Soft delete the role
            $role->delete();

            // Return success response
            return response()->json(['status' => 'success', 'message' => 'Role deleted successfully'], 200);
        }

        // Return error response if role not found
        return response()->json(['status' => 'error', 'message' => 'Role not found.'], 404);
    } catch (\Exception $e) {
        // Log the error
        Log::error('Error deleting role: ' . $e->getMessage());

        // Return error response
        return response()->json(['status' => 'error', 'message' => 'An error occurred while deleting the role.'], 500);
    }
}




    // this function will update the roles
    public function update(Request $request,$id){
        $data =[
            'name'=>'required|unique:roles,name,'.$id,
            "permissions"    => "required|array|min:1",
            "permissions.*"  => "required|string|distinct|min:1",
           
        ];
         $validation =    Validator::make($request->all(),$data);
      
        if($validation->fails()) {
            return redirect()->back()->withErrors($validation);
        }
        $role = Role::find($id);
        $role->update(['name'=>$request->name]);
        $permissions = $request->permissions;
        $role->permissions()->sync($permissions);
        return redirect()->to('/roles');
    }
    // this function will delte the role
    public function destroy(Request $request){
        $id = $request->id;
        $role = Role::find($id);
         if($role){
             $rper =  $role->permissions->pluck('id')->toArray();

             if($role->users){
                foreach($role->users as $user){
                    $user->permissions()->detach($rper);
                }
             }
            $role->permissions()->detach();
            $role->delete();
            return response()->json(['success'=>true],200);
         }
         return response()->json(['success'=>false],404);
      }
}
