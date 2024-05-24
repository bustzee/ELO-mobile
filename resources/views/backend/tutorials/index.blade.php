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

         @if(session('success'))
            <div class="alert alert-success">
               {{ session('success') }}
            </div>
         @endif

         @if(session('error'))
            <div class="alert alert-danger">
               {{ session('error') }}
            </div>
         @endif

         <div class="card">
            <div class="card-header">
               <h3 class="card-title">Tutorials</h3>
                <div class="card-tools">
                     <a href="{{ route('tutorials.create') }}" class="btn btn-info btn-sm"><i class="fa fa-plus"></i> Add new tutorial</a>
                  </div>
            </div>
            <div class="card-body  p-0">

               <table class="table table-bordered">
                  <thead>
                     <tr>
                        <th style="width: 10px">#</th>
                        <th>Name</th>
                        <th>Type</th>
                        <th>Youtube URL</th>
                        <th>Action</th>
                     </tr>
                  </thead>
                  <tbody>
                     @foreach (@$tutorials as $key => $tutorial) 
                     <tr>
                        <td>{{ $key+1 }}.</td>
                        <td>{{ $tutorial->name }}</td>
                        <td>{{ $tutorial->type }}</td>
                        <td><a href="{{ $tutorial->tutorial_url }}" target="_new">Youtube Link</a></td>
                        <td>
                            <a href="{{ route('tutorials.edit', $tutorial->id) }}" class="btn btn-sm btn-primary">Edit</a>
                                <form action="{{ route('tutorials.destroy', $tutorial->id) }}" method="POST" style="display: inline;">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this tutorial?')">Delete</button>
                                </form>
                        </td>
                     </tr>
                     @endforeach
                  </tbody>
               </table>
            </div>
            <div class="card-footer clearfix">
               {{ $tutorials->links() }}
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