<!-- This page show list of betting amount master -->
@extends('layout.admin.layout')
@section('title', 'Filters')
@section('css')
@endsection
@section('content') 
<div class="content-wrapper">
   <section class="content-header">
      <div class="container-fluid">
         <div class="row mb-2">
            <div class="col-sm-6">
               <h1>Manage Tutorials</h1>
            </div>
            <div class="col-sm-6">
               <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="{{url('/dashboard')}}">Dashboard</a></li>
                  <li class="breadcrumb-item active">Manage Tutorials</li>
               </ol>
            </div>
         </div>
      </div>
   </section>
   <!-- Main content -->
   <section class="content">
      <div class="container-fluid">
      <div class="row">
      <div class="col-md-12">
         <div class="card">
        <div class="card-header">
            Create Tutorial
        </div>
        <div class="card-body">
           
            @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
            @endif

            <form method="POST" action="{{ route('tutorials.store') }}" enctype="multipart/form-data">
                @csrf

                <div class="form-group">
                    <label for="type">Type:</label>
                    <select class="form-control" id="type" name="type">
                        <option value="document">Document</option>
                        <option value="video">Video</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>

                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                </div>

                <div class="form-group">
                    <label for="url">YouTube URL:</label>
                    <input type="text" class="form-control" id="tutorial_url" name="tutorial_url">
                </div>

                <div class="form-group">
                    <label for="document_attachment">Document Attachment:</label>
                    <input type="file" class="form-control-file" id="document_attachment" name="document_attachment">
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
     </div>
    </div> 
 </div>
  </section>
</div>
@endsection
@section('js')

@endsection