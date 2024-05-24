@extends('master')
@section('content')

<style>
    .accordion-button::after {
        filter: invert(1);
    }
</style>
<div class="page-wrapper">
    <div class="page-content">
        <section class="pt-md-5 pt-sm-3 ">
            <div class="container">
                <div class="row">
                    <!-- <div class="col-md-4 border-right" style="background-color:#090d55">
                        <div class="d-flex flex-column align-items-left text-center p-1 py-1">
                            @if(auth()->user()->profile)
                            <img src="{{url('/')}}/images/{{auth()->user()->profile}}" class="rounded-circle mt-3" width="100px" height="100px">
                            @else
                            <img src="{{ asset('assets/front/images/avatar.jpg') }}" class="rounded-circle mt-3" width="100px" height="100px" />
                            @endif
                        </div>
                        <div class="p-3 py-5">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile </h4>
                                <hr>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12">
                                    <label class="labels">
                                        <h6 class="text-right">
                                            Username:
                                            {{ $profile->username }}
                                        </h6>
                                    </label>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12">
                                    <label class="labels">
                                        <h6 class="text-right">
                                            Email: {{ $profile->email }}
                                        </h6>
                                    </label>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12">
                                    <label class="labels">
                                        <h6 class="text-right">
                                            Phone:
                                            {{ $profile->phone}}
                                        </h6>
                                    </label>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12">
                                    <label class="labels">
                                        <h6 class="text-right">
                                            Business Info:
                                            {{ $profile->business_info }}
                                        </h6>
                                    </label>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12">
                                    <label class="labels">
                                        <h6 class="text-right">
                                            Address:
                                            {{ $profile->address }}
                                        </h6>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="p-3 ">

                            <h4 class="text-right">Bank Details </h4>
                            <hr>

                            @if (Session::has('success'))
                            <div class="alert alert-success">
                                {{ Session::get('success') }}
                            </div>
                            @endif

                            <form id="bankFormId" action="{{ route('update-user-bank-details') }}" method="post">
                                @csrf
                                <div class="row">
                                    <div class="col-sm-6 mb-3">
                                        <label for="bankName" class="form-label">Bank Name</label>
                                        <input type="text" class="form-control" id="bank_name" name="bank_name" value="{{ isset($bank_details->bank_name)?$bank_details->bank_name:'' }}">
                                        @error('bank_name')
                                        <div class="text-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <label for="accountNumber" class="form-label">Account Number</label>
                                        <input type="text" class="form-control" id="accountNumber" name="account_number" value="{{ isset($bank_details->account_number)?$bank_details->account_number:'' }}">
                                        @error('account_number')
                                        <div class="text-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <label for="branchName" class="form-label">Branch Name</label>
                                        <input type="text" class="form-control" id="branchName" name="branch_name" value="{{ isset($bank_details->branch_name)?$bank_details->branch_name:'' }}">
                                        @error('branch_name')
                                        <div class="text-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <label for="ifscCode" class="form-label">IFSC Code</label>
                                        <input type="text" class="form-control" id="ifscCode" name="ifsc_code" value="{{ isset($bank_details->ifsc_code)?$bank_details->ifsc_code:'' }}">
                                        @error('ifsc_code')
                                        <div class="text-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <label for="micrCode" class="form-label">MICR Code</label>
                                        <input type="text" class="form-control" id="micrCode" name="micr_code" value="{{ isset($bank_details->micr_code)?$bank_details->micr_code:'' }}">
                                        @error('micr_code')
                                        <div class="text-danger">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <label for="swiftCode" class="form-label">SWIFT Code</label>
                                        <input type="text" class="form-control" id="swiftCode" name="swift_code" value="{{ isset($bank_details->swift_code)?$bank_details->swift_code:'' }}">
                                        @error('swift_code')
                                        <div class="text-danger">{{ $message }}</div>
                                        @enderror
                                    </div>

                                    <div class="col-sm-6 mb-3">
                                        <label for="swiftCode" class="form-label">Routing Number </label>
                                        <input type="text" class="form-control" id="routingNumber" name="routing_number" value="{{ isset($bank_details->routing_number)?$bank_details->routing_number:'' }}">
                                        @error('routing_number')
                                        <div class="text-danger">{{ $message }}</div>
                                        @enderror
                                    </div>


                                </div>
                                <button type="submit" class="btn btn-primary">Save</button>
                            </form>
                        </div>
                    </div> -->
                    <div class="col-md-4 border-right" style="background-color:#090d55">
                                <div class="d-flex flex-column align-items-center text-center p-1 py-1">
                                    <img src="https://uat.elo-esports.com/assets/front/images/avatar.jpg"
                                        class="rounded-circle mt-3" width="100px" height="100px" />
                                    <label class="labels mt-2">
                                        <h4 class="text-right">
                                        {{ $profile->username }}
                                        </h4>
                                    </label>
                                </div>
                                <div class="accordion mt-3" id="accordionExample">
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingOne">
                                            <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                                data-bs-target="#collapseOne" aria-expanded="true"
                                                aria-controls="collapseOne">
                                                My Profile
                                            </button>
                                        </h2>
                                        <div id="collapseOne" class="accordion-collapse collapse show"
                                            aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                                            <div class="accordion-body">
                                            <div class="d-flex flex-column align-items-left text-center p-1 py-1">
                            @if(auth()->user()->profile)
                            <img src="{{url('/')}}/images/{{auth()->user()->profile}}" class="rounded-circle mt-3" width="100px" height="100px">
                            @else
                            <img src="{{ asset('assets/front/images/avatar.jpg') }}" class="rounded-circle mt-3" width="100px" height="100px" />
                            @endif
                        </div>
                        <div class="p-3">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h4 class="text-right">Profile </h4>
                                <hr>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12">
                                    <label class="labels">
                                        <h6 class="text-right">
                                            Username:
                                            {{ $profile->username }}
                                        </h6>
                                    </label>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12">
                                    <label class="labels">
                                        <h6 class="text-right">
                                            Email: {{ $profile->email }}
                                        </h6>
                                    </label>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12">
                                    <label class="labels">
                                        <h6 class="text-right">
                                            Phone:
                                            {{ $profile->phone}}
                                        </h6>
                                    </label>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12">
                                    <label class="labels">
                                        <h6 class="text-right">
                                            Business Info:
                                            {{ $profile->business_info }}
                                        </h6>
                                    </label>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-12">
                                    <label class="labels">
                                        <h6 class="text-right">
                                            Address:
                                            {{ $profile->address }}
                                        </h6>
                                    </label>
                                </div>
                            </div>
                        </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="accordion-item">
                                        <h2 class="accordion-header" id="headingTwo">
                                            <button class="accordion-button collapsed" type="button"
                                                data-bs-toggle="collapse" data-bs-target="#collapseTwo"
                                                aria-expanded="false" aria-controls="collapseTwo">
                                                Bank Details
                                            </button>
                                        </h2>
                                        <div id="collapseTwo" class="accordion-collapse collapse"
                                            aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                                            <div class="accordion-body">
                                            <div class="p-3 ">

<h4 class="text-right">Bank Details </h4>
<hr>

@if (Session::has('success'))
<div class="alert alert-success">
    {{ Session::get('success') }}
</div>
@endif

<form id="bankFormId" action="{{ route('update-user-bank-details') }}" method="post">
    @csrf
    <div class="row">
        <div class="col-sm-6 mb-3">
            <label for="bankName" class="form-label">Bank Name</label>
            <input type="text" class="form-control" id="bank_name" name="bank_name" value="{{ isset($bank_details->bank_name)?$bank_details->bank_name:'' }}">
            @error('bank_name')
            <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-sm-6 mb-3">
            <label for="accountNumber" class="form-label">Account Number</label>
            <input type="text" class="form-control" id="accountNumber" name="account_number" value="{{ isset($bank_details->account_number)?$bank_details->account_number:'' }}">
            @error('account_number')
            <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-sm-6 mb-3">
            <label for="branchName" class="form-label">Branch Name</label>
            <input type="text" class="form-control" id="branchName" name="branch_name" value="{{ isset($bank_details->branch_name)?$bank_details->branch_name:'' }}">
            @error('branch_name')
            <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-sm-6 mb-3">
            <label for="ifscCode" class="form-label">IFSC Code</label>
            <input type="text" class="form-control" id="ifscCode" name="ifsc_code" value="{{ isset($bank_details->ifsc_code)?$bank_details->ifsc_code:'' }}">
            @error('ifsc_code')
            <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-sm-6 mb-3">
            <label for="micrCode" class="form-label">MICR Code</label>
            <input type="text" class="form-control" id="micrCode" name="micr_code" value="{{ isset($bank_details->micr_code)?$bank_details->micr_code:'' }}">
            @error('micr_code')
            <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>
        <div class="col-sm-6 mb-3">
            <label for="swiftCode" class="form-label">SWIFT Code</label>
            <input type="text" class="form-control" id="swiftCode" name="swift_code" value="{{ isset($bank_details->swift_code)?$bank_details->swift_code:'' }}">
            @error('swift_code')
            <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>

        <div class="col-sm-6 mb-3">
            <label for="swiftCode" class="form-label">Routing Number </label>
            <input type="text" class="form-control" id="routingNumber" name="routing_number" value="{{ isset($bank_details->routing_number)?$bank_details->routing_number:'' }}">
            @error('routing_number')
            <div class="text-danger">{{ $message }}</div>
            @enderror
        </div>


    </div>
    <button type="submit" class="btn btn-primary">Save</button>
</form>
</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                    <div class="col-md-8 border-right" style="background-color:#090d4d">
                        <div class="col-md-12">
                            <div class="p-3 py-5">
                                <div class="col-md-12 d-flex justify-content-between align-items-center mb-3">
                                    <h5 class="text-right">
                                        <button type="button" class="btn btn-success mt-1" data-bs-toggle="modal" data-bs-target="#exampleModalCenter1">
                                            Elo Balance
                                        </button>
                                        : {{ $profile->elo_balance }}

                                        @if ($profile->elo_balance > $setting->min_wallet_trasfer_amount)
                                        <button type="button" class="btn btn-danger mt-1" data-bs-toggle="modal" data-bs-target="#TransferwalletToPaypal">
                                            Transfer To Paypal
                                        </button>
                                        @endif
																  
                                    </h5>
									<div class = "float-right">
										@if($profile->user_age >= 21)
											<button type="button" class="btn btn-success purchase_elo_btn"
												data-bs-toggle="modal" data-bs-target="#exampleModalCenter1">
												Purchase ELO
											</button>
										@endif
									</div>
                                </div>
                                <hr>

                                <div class="col-md-12 d-flex1 justify-content-between align-items-center mb-3">
                                    <div class="row">
                                        <div class="col-md-8 bg-light pt-2 mt-1">
                                            <h5 class="fs-6">
                                                Stream Key: {{ $profile->stream_key }}

                                                <div style="display:none">
                                                    <input type="text" id="myInputCopy" value="{{ $profile->stream_key }}">
                                                </div>
                                            </h5>
                                        </div>
                                        <div class="col-md-4 mt-1">
                                            <button onclick="myFunctionCopy()" class="btn btn-success">
                                                Copy Stream Key
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <!-- <div class="col-md-12 d-flex justify-content-between align-items-center mb-3">
                                    <h5 class="text-right">List Of Deposits </h5>
                                </div> -->
                                <div class="accordion mt-3" id="accordionDeposits">
                                            <div class="accordion-item">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button collapsed" type="button"
                                                        data-bs-toggle="collapse" data-bs-target="#bankDetails"
                                                        aria-expanded="false" aria-controls="bankDetails">
                                                        List Of Deposits
                                                    </button>
                                                </h2>
                                                <div id="bankDetails" class="accordion-collapse collapse" aria-labelledby="bankDetails" data-bs-parent="#accordionDeposits">
                                                    <div class="accordion-body">
                                                    <div class="table-responsive">
                                    <table class="table table-bordered table-responsive">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>Deposited Amount</th>
                                                <th>Transaction Id</th>
                                                <th>Status</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($deposits as $k => $deposite)
                                            <tr>
                                                <td>{{ $deposite->transaction_amount }}</td>
                                                <td>{{ $deposite->transaction_id }}</td>
                                                <td>{{ $deposite->comment }}</td>
                                                <td>{{ $deposite->created_at }}</td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="accordion-item">
                                                <h2 class="accordion-header">
                                                    <button class="accordion-button collapsed" type="button"
                                                        data-bs-toggle="collapse" data-bs-target="#withdrawlsbankDetails"
                                                        aria-expanded="false" aria-controls="withdrawlsbankDetails">
                                                        List Of withdrawals
                                                    </button>
                                                </h2>
                                                <div id="withdrawlsbankDetails" class="accordion-collapse collapse" aria-labelledby="withdrawlsbankDetails" data-bs-parent="#accordionDeposits">
                                                    <div class="accordion-body">
                                                    <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>Withdrawal Amount</th>
                                                <th>Email Id</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($withdrawls as $withdrawl)
                                            <tr>
                                                <td>{{ $withdrawl->transaction_amount }}</td>
                                                <td>{{ $withdrawl->email_id }}</td>
                                                <td>{{ $withdrawl->created_at }}</td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>

                                <a href="{{ route('my_transactions') }}" title="View All Transaction">View All</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                <!-- <div class="col-md-12 d-flex justify-content-between align-items-center mb-3">
                                    <h5 class="text-right">List Of withdrawals</h5>
                                </div> -->
                            </div>
													<div class="col-md-12 pb-3" >
							<div class="mb-3">
							   <h5 class="pl-3">Tutorial videos </h5>
							</div>
							@include('tutorials_carousel',['page' => "3"])
						</div>

                        </div>						
                    </div>
                </div>
            </div>
    </div>
    </section>
</div>
</div>

@include('purchase_elo')
@include('transfer_elo')
@endsection

@section('js')
<!-- <script src="https://www.paypal.com/sdk/js?client-id={{ \Crypt::decryptString($setting->client_id) }}&currency=USD"></script> -->
<script type="text/javascript">
    $('#completion-block').hide();

    $('#trasfer_submit').click(function() {
        var wallet_balace = parseFloat($('#wallet_balace').val());
        var amount = parseFloat($('#amount').val());
        var paypal_email = $('#paypal_email').val();
        if (!Number.isNaN(amount)) {
            if (paypal_email.length) {
                if (amount > wallet_balace) {
                    alert('You can withdrawal - ' + wallet_balace + ' ');
                } else {
                    $('#create_bet2_frm').submit();
                }
            } else {
                alert('Please enter paypal email id')
            }
        } else {
            alert('Please enter amount')
        }
    });

    $("#purchase_elo").keyup(function() {
        var conversion = "1";
        var val = this.value + ' ELO = ' + conversion * this.value + ' USD';
        $("#calcELO").text(val);
    });

    var payment_success = 0;
    var transaction_id = 0;
    var status = 0;
    var base_url = "{{url('/')}}";
    var conversion = "1";
    var username = "{{Cookie::get('username')}}";
    var purchase_elo = $('#purchase_elo').val();

    var usd_amount = purchase_elo * conversion;

    paypal.Buttons({
        // Sets up the transaction when a payment button is clicked
        createOrder: (data, actions) => {
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        value: $('#purchase_elo').val() * conversion // Can also reference a variable or function
                    }
                }]
            });
        },
        // Finalize the transaction after payer approval
        onApprove: (data, actions) => {
            return actions.order.capture().then(function(orderData) {
                const transaction = orderData.purchase_units[0].payments.captures[0];

                transaction_id = transaction.id;
                status = transaction.status;
                console.log("inside COMPLETED status");

                $('#completion-block').show();

                payment_success = 1;
                if (transaction.status == 'COMPLETED')
                    $('#completion-text').text("Your payments processed successfully, Payment Status: " + transaction.status);
                else
                    $('#completion-text').text("Your payments is on hold, Payment Status: " + transaction.status);

                $('#model_body').hide();
                $('#paypal-button-container').hide();

                var purchase_elo = $('#purchase_elo').val();

                var usd_amount = purchase_elo * conversion;

                var param = "?status=" + transaction.status + "&transaction_id=" + transaction.id + "&elo_amount=" + purchase_elo + "&usd_amount=" + usd_amount + "&user_name=" + username;

                $.ajax({
                    type: "POST",
                    url: "{{url('/transfer_paypal_to_wallet')}}",
                    data: {
                        _token: "{{ csrf_token() }}",
                        status: transaction.status,
                        transaction_id: transaction.id,
                        elo_amount: purchase_elo,
                        usd_amount: usd_amount
                    },
                    dataType: 'JSON',
                    success: function(data) {
                        window.location.href = "{{url('/profile')}}"
                    }
                });
            });

        }
    }).render('#paypal-button-container');

    var is_open_popup = "{{$open_popup}}";
    if (is_open_popup == "1") {
        $('.purchase_elo_btn').trigger("click");
    }

    function myFunctionCopy() {
        var copyText = document.getElementById("myInputCopy");

        copyText.select();
        copyText.setSelectionRange(0, 99999);
        navigator.clipboard.writeText(copyText.value);
        alert("Copied the text: " + copyText.value);
    }
</script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Listen for click events on video links
        var videoLinks = document.querySelectorAll('.video-link');
        videoLinks.forEach(function (videoLink) {
            videoLink.addEventListener('click', function (event) {

                event.preventDefault();
                var videoId = this.getAttribute('data-video-id');
                // Set the video iframe src attribute to the YouTube video URL
                
                var videoId = getYouTubeId(videoId);
                if (videoId) {
                    // Set the video iframe src attribute to the YouTube video URL
                    document.querySelector('#videoContainer').innerHTML = '<iframe width="100%" height="400" src="https://www.youtube.com/embed/' + videoId + '" frameborder="0" allowfullscreen></iframe>';
                    $('#videoModal').modal('show'); // Open the modal
                } else {
                    console.error('Invalid YouTube URL');
                }

            });
        });
    });
     function getYouTubeId(url) {
            if (!url) return null; // Check if url is null or undefined
            var match = url.match(/(?:https?:\/\/)?(?:www\.)?youtu(?:be\.com\/(?:embed\/|watch\?v=)|\.be\/)([a-zA-Z0-9_-]{11})/);
            return match && match[1];
        }
</script>
@endsection