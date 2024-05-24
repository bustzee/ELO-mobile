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
               <h1>Streams Betting Disputes</h1>
            </div>
            <div class="col-sm-6">
               <ol class="breadcrumb float-sm-right">
                  <li class="breadcrumb-item"><a href="{{url('/dashboard')}}">Dashboard</a></li>
                  <li class="breadcrumb-item active">Streams Betting Disputes</li>
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
               <h3 class="card-title">Reported Streams</h3>
                <div class="card-tools">
                   
                  </div>
            </div>
            <div class="card-body  p-0">

               <table class="table table-bordered">
                  <thead>
                     <tr>
                        <th style="width: 10px">#</th>
                        <th>Strem Name</th>
                        <th>Username</th>
                        <th>Bet</th>
                        <th>Dispute For</th>
                        <th>remark</th>
                        <th>Created Aa</th>
                     </tr>
                  </thead>
                  <tbody>
                     @foreach ($records as $key => $row) 
                     <tr>
                        <td>{{ $key+1 }}.</td>
                        <td>{{ $row->livestream->name }}</td>
                        <td>{{ $row->user->username }}</td>
                        <td>{{ $row->bet->game_name }}</td>
                        <td>{{ $row->dispute_for }}</td>
                        <td>{{ $row->remark }}</td>
                        <td>{{ $row->created_at }}</td>
                      
                     </tr>
                     @endforeach
                  </tbody>
               </table>
            </div>
            <div class="card-footer clearfix">
               {{ $records->links() }}
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