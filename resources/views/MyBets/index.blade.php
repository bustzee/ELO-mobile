@extends('master')

@section('content')
<div class="page-wrapper">
    <div class="page-content">
        <section class="pt-md-5 pt-sm-3 ">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 table-responsive">
                        <h2 style="color:#fff">My Bettings</h2>

                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Stream Name</th>
                                    <th scope="col">Started On</th>
                                    <th scope="col">Bet Description</th>
                                    <th scope="col">For Text</th>
                                    <th scope="col">Against Text</th>
                                    <th scope="col">Bet On</th>
                                    <th scope="col">Bet Amount</th>
                                    <th scope="col">Vig Amount</th>
                                    <th scope="col">Won Amount</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Bet Date</th>
                                    <th></th>

                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $winAmount=0;
                                $vigAmount =0;
                                    $amount=0;
                                @endphp
                                @foreach (@$records as $key=>$result)
                                    <tr>
                                        <td>{{ $key+1 }} </td>
                                        <td>{{ $result->livestreams->name }}</td>
                                        <td>{{ date('Y-m-d h:i:s A',strtotime($result->livestreams->created_at)) }}</td>
                                        <td>{{ $result->betmain->description }}</td>
                                        <td>{{ $result->betmain->for_text }}</td>
                                        <td>{{ $result->betmain->against_text }}</td>
                                        <td>{{ ucfirst($result->bet_on) }}</td>
                                        <td>{{ $result->amount }}</td>
                                        <td>{{ $result->vig_amount }}</td>
                                        <td>{{ $result->win_amount }}</td>
                                        @php
                                            $winAmount += $result->win_amount;
                                        @endphp
                                        @php $vigAmount +=$result->vig_amount @endphp
                                        @php $amount +=$result->amount @endphp
                                        <td>
                                        @if($result->betmain->is_declared_result)
                                            @if($result->is_win == 1)
                                                <label class="  btn-success btn-sm"> Won </label>
                                            @elseif($result->is_win == '-4')
                                            <label class="  btn-danger btn-sm">Abandoned</label>
                                            @else
                                                <label class="  btn-danger btn-sm">Lost</label>
                                            @endif
                                        @else
                                            @if($result->is_claimed)
                                                <label class="  btn-primary btn-sm"> Claimed </label>
                                            @else
                                                <label class="  btn-warning btn-sm">Pending</label>
                                            @endif
                                        @endif</td>
                                        <td>{{ date('Y-m-d h:i:s A',strtotime($result->created_at)) }}</td>
                                        <td>
                                        @if(!$result->livestreams->type && $result->livestreams->status != "stopped")
                                            <a href="{{ url('stream/'.$result->livestreams->id)}}">View</a>
                                            |
                                             <a type="button" class="row-clickable" data-stream-id="{{ $result->livestreams->id }}" data-stream-name="{{ $result->livestreams->name }}" data-bet-id="{{ $result->id }}">Dispute</a>

                                        @else
                                            Ended
                                        @endif
                                        </td>
                                        
                                    </tr>
                                @endforeach

                                <tr>
                                    <td colspan="7"></td>
                                    <td colspan="">
                                        {{ $amount }}
                                    </td>
                                    <td colspan="">{{ $vigAmount}}</td>
                                    <td colspan="">{{ $winAmount}}</td>
                                    <td colspan="3"></td>
                                <tr>
                            </tbody>
                            <tfoot>
                            {{ $records->links() }}
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>



 <div class="modal fade" id="disputeModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
  <div class="modal-dialog">
      <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title" id="disputeModalLabel">Raise Betting Dispute</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
              <!-- Form for reporting -->
             <form id="disputeForm" name="disputeForm" method="post">
                   @csrf
                   <div class="row">
                      <div class="col-md-12">
                         <input type="hidden" class="form-control" id="stream_id" name="stream_id" value="">
                         <input type="hidden" class="form-control" id="bet_id" name="bet_id" value="">
                         <div class="mb-3">
                            <label for="reportStreamName" class="form-label">Stream Name</label>
                            <input type="text" class="form-control" id="stream_name" name="stream_name" value="" readonly>
                         </div>
                      </div>
                   </div>
                   <div class="row">
                      <div class="col-md-6">
                         <div class="mb-3">
                            <label for="disputeName" class="form-label">Name</label>
                            <input type="text" class="form-control" id="disputeName" name="name" value="{{ auth()->check() ? auth()->user()->firstName : '' }}" @if(auth()->check()) readonly @endif>
                            <span id="disputeNameError" class="text-danger"></span>
                         </div>
                      </div>
                      <div class="col-md-6">
                         <div class="mb-3">
                            <label for="disputeMobile" class="form-label">Mobile</label>
                            <input type="text" class="form-control" name="mobile"  id="disputeMobile" value="{{ auth()->check() ? auth()->user()->phone : '' }}" @if(auth()->check()) readonly @endif>
                            <span id="disputeMobileError" class="text-danger"></span>
                         </div>
                      </div>
                   </div>
                   <div class="row">
                      <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Dispute For</label><br>
                                @foreach(getDisputeOptions() as $key => $value)
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="dispute_for" id="{{ $key }}" value="{{ $key }}">
                                    <label class="form-check-label" for="{{ $key }}">{{ $value }}</label>
                                </div>
                                @endforeach
                                <span id="disputeforError" class="text-danger"></span>
                                
                            </div>
                        </div>
                   </div>
                   <div class="row">
                      <div class="col-md-12">
                         <div class="mb-3">
                            <label for="disputeRemark" class="form-label">Remarks</label>
                            <textarea class="form-control" id="disputeRemark" name="remark" rows="2"></textarea>
                            <span id="disputeRemarkError" class="text-danger"></span>
                         </div>
                      </div>
                   </div>
                </form>
          </div>
          <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="button" id="submit_dispute_form" class="btn btn-primary">Submit</button>
          </div>
      </div>
  </div>
</div>


@endsection

@section('js')
<script>
  // JavaScript to handle row click event and show the modal
  $(document).ready(function() {
    $('.row-clickable').click(function() {
      var streamId = $(this).data('stream-id');
      var stream_name = $(this).data('stream-name');
      var betId = $(this).data('bet-id');
      
      $("#stream_id").val(streamId) 
      $("#stream_name").val(stream_name) 
      $("#bet_id").val(betId) 

      $('#disputeModal').modal('show');
    });
  });

$('body').on('click', '#submit_dispute_form', function () {
    //$('#reportForm').on('submit', function(e) {
        event.preventDefault(); // Prevent default form submission
       
        // Get values of form fields
       var name = $('#disputeName').val();
       var mobile = $('#disputeMobile').val();
      // var email = $('#disputeEmail').val();
       var remark = $('#disputeRemark').val();
       var dispute_for = $('input[name="dispute_for"]:checked').val();


       // Trim the values (if they are defined)
       name = name ? name.trim() : '';
       mobile = mobile ? mobile.trim() : '';
      // email = email ? email.trim() : '';
       remark = remark ? remark.trim() : '';
       dispute_for = dispute_for ? dispute_for.trim() : '';
       


       // Perform validation
       var errors = false;
       if (!name) {
           $('#disputeNameError').text('Name is required.');
           errors = true;
       } else {
           $('#disputeNameError').text('');
       }

       if (!mobile) {
           $('#disputeMobileError').text('Mobile is required.');
           errors = true;
       } else if (!/^\d{10}$/.test(mobile)) {
           $('#disputeMobileError').text('Invalid mobile number.');
           errors = true;
       } else {
           $('#disputeMobileError').text('');
       }

       // if (!email) {
       //     $('#disputeEmailError').text('Email is required.');
       //     errors = true;
       // } else if (!/^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/.test(email)) {
       //     $('#disputeEmailError').text('Invalid email address.');
       //     errors = true;
       // } else {
       //     $('#disputeEmailError').text('');
       // }

       if (!dispute_for) {
           $('#disputeforError').text('Please choose an option.');
           errors = true;
       } else {
           $('#disputeforError').text('');
       }

       if (!remark) {
           $('#disputeRemarkError').text('remark is required.');
           errors = true;
       } else {
           $('#disputeRemarkError').text('');
       }

       // If there are errors, stop the submission
       if (errors) {
           return;
       }
       
       // If validation passes, proceed with AJAX request
       var formData = $('#disputeForm').serialize(); // Serialize form data
       $.ajax({
            url: "{{route('save-dispute')}}",
           type: 'POST',
           data: formData,
           success: function(response) {
               // Handle success
               console.log(response);
               alert("Bettting Dispute sumbited successfully");
               $('#disputeModal').modal('hide');
           },
           error: function(xhr, status, error) {
               // Handle errors
               console.error(xhr.responseText);
               alert("Something went wrong");
           }
       });
    });  
</script>

@endsection
