<?php

namespace App\Http\Controllers\Admin;

use App\Models\Tutorial;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class TutorialController extends Controller
{
    public function index()
    {
        $tutorials = Tutorial::paginate(10); 
        return view('backend.tutorials.index', compact('tutorials'));
    }

    public function create()
    {
        return view('backend.tutorials.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'type' => 'required|in:document,video',
            'name' => 'required',
            'description' => 'required',
            'tutorial_url' => 'nullable|url',
            'document_attachment' => 'nullable|file|mimes:pdf|max:10240',
        ]);

        $data = $request->all();

        // Upload document_attachment if it's provided
        if ($request->hasFile('document_attachment')) {
            $file = $request->file('document_attachment');
            $path = $file->store('tutorials');
            $data['document_attachment'] = $path;
        }

        Tutorial::create($data);

        return redirect()->route('tutorials.index')->with('success', 'Tutorial created successfully.');
    }

    public function show(Tutorial $tutorial)
    {
        return view('backend.tutorials.show', compact('tutorial'));
    }

    public function edit(Tutorial $tutorial)
    {
        return view('backend.tutorials.edit', compact('tutorial'));
    }

    public function update(Request $request, Tutorial $tutorial)
    {
       $data = $request->all();

        // Check if a new document attachment is provided
        if ($request->hasFile('document_attachment')) {
            $file = $request->file('document_attachment');
            $path = $file->store('tutorials'); // Store in public/tutorials directory
            $data['document_attachment'] = str_replace(' ', '_', $path); // Store path in database without 'public/' prefix
        } else {
            // No new document attachment provided, keep the existing one
            unset($data['document_attachment']);
        }

        $tutorial->update($data);

        return redirect()->route('tutorials.index')->with('success', 'Tutorial updated successfully.');
    }

    public function destroy(Tutorial $tutorial)
    {
        $tutorial->delete();

        return redirect()->route('tutorials.index')->with('success', 'Tutorial deleted successfully.');
    }



// API-
public function getTutorial()
{
    try {
        // Fetch paginated tutorials
        $tutorials = Tutorial::all();

        // Return success response
        return response()->json([
            'status' => 'success',
            'data' => $tutorials
        ], 200);
    } catch (\Exception $e) {
        // Log the error
        Log::error('Error fetching tutorials: ' . $e->getMessage());

        // Return error response
        return response()->json([
            'status' => 'error',
            'message' => 'Failed to fetch tutorials.',
        ], 500);
    }
}
public function createTutorial(Request $request)
{
    try {
        // Validate incoming data
        $validator = Validator::make($request->all(), [
            'type' => 'required|in:document,video',
            'name' => 'required',
            'description' => 'required',
            'tutorial_url' => 'nullable|url',
            'document_attachment' => 'nullable|string', // Update validation rule
        ]);

        // Check if validation fails
        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->errors()], 400);
        }

        // Extract data from the request
        $data = $request->only(['type', 'name', 'description', 'tutorial_url']);

        // Upload document_attachment if provided
        if ($request->has('document_attachment')) {
            // Decode the base64 string
            $base64Content = $request->input('document_attachment');
            $decodedContent = base64_decode($base64Content);

            // Generate a unique file name
            $fileName = uniqid('document_attachment_') . '.pdf';

            // Store the decoded content in a file
            $path = 'tutorials/' . $fileName;
            Storage::put($path, $decodedContent);

            // Set the path in the data array
            $data['document_attachment'] = $path;
        }

        // Create the tutorial
        $tutorial = Tutorial::create($data);

        // Get the public URL of the stored file
        $publicUrl = Storage::url($tutorial->document_attachment);

        // Return success response with the public URL
        return response()->json(['status' => 'success', 'message' => 'Tutorial created successfully.']);
    } catch (\Exception $e) {
        // Log error and return error response
        Log::error('Error creating tutorial: ' . $e->getMessage());
        return response()->json(['status' => 'error', 'message' => 'Failed to create tutorial'], 500);
    }
}



public function updateTutorial(Request $request)
{
    try {
        // Validate incoming data
        $validator = Validator::make($request->all(), [
            'id' => 'required|integer', // Add validation rule for ID
            'type' => 'required|in:document,video',
            'name' => 'required',
            'description' => 'required',
            'tutorial_url' => 'nullable|url',
            'document_attachment' => 'nullable|string', // Update validation rule
        ]);

        // Check if validation fails
        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->errors()], 400);
        }

        // Extract ID and other data from the request
        $id = $request->input('id');
        $data = $request->only(['type', 'name', 'description', 'tutorial_url']);

        // Find the tutorial by ID
        $tutorial = Tutorial::findOrFail($id);

        // Upload document_attachment if provided
        if ($request->has('document_attachment')) {
            // Decode the base64 string
            $base64Content = $request->input('document_attachment');
            $decodedContent = base64_decode($base64Content);

            // Generate a unique file name
            $fileName = uniqid('document_attachment_') . '.pdf';

            // Store the decoded content in a file
            $path = 'tutorials/' . $fileName;
            Storage::put($path, $decodedContent);

            // Set the path in the data array
            $data['document_attachment'] = $path;
        }

        // Update the tutorial with the new data
        $tutorial->update($data);

        // Return success response
        return response()->json(['status' => 'success', 'message' => 'Tutorial updated successfully.']);
    } catch (\Exception $e) {
        // Log error and return error response
        Log::error('Error updating tutorial: ' . $e->getMessage());
        return response()->json(['status' => 'error', 'message' => 'Failed to update tutorial'], 500);
    }
}



public function deleteTutorial(Request $request)
{
    try {
        // Validate incoming data
        $validator = Validator::make($request->all(), [
            'id' => 'required|integer',
        ]);

        // Check if validation fails
        if ($validator->fails()) {
            return response()->json(['status' => 'error', 'message' => $validator->errors()], 400);
        }

        // Extract ID from the request
        $id = $request->input('id');

        // Find the tutorial by ID
        $tutorial = Tutorial::find($id);

        // Check if the tutorial exists
        if (!$tutorial) {
            return response()->json(['status' => 'error', 'message' => 'Tutorial not found'], 404);
        }

        // Delete the tutorial
        $tutorial->delete();

        return response()->json(['status' => 'success', 'message' => 'Tutorial deleted successfully.']);
    } catch (\Exception $e) {
        // Log error and return error response
        Log::error('Error deleting tutorial: ' . $e->getMessage());
        return response()->json(['status' => 'error', 'message' => 'Failed to delete tutorial'], 500);
    }
}

}
