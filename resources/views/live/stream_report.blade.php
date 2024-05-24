 <button type="button" class="btn btn-warning w-100" data-bs-toggle="modal" data-bs-target="#reportModal">Report</button>

<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
<div class="modal-dialog">
<div class="modal-content">
  <div class="modal-header">
      <h5 class="modal-title" id="reportModalLabel">Report</h5>
      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
  </div>
  <div class="modal-body">
      <!-- Form for reporting -->
      <form id="reportForm" name="reportForm" method="post">
    @csrf
    <input type="hidden" class="form-control" id="stream_id" name="stream_id" value="{{ $livestream->id }}">
    <div class="row">
        <div class="col-md-6">
            <div class="mb-3">
                <label for="reportStreamName" class="form-label">Stream Name</label>
                <input type="text" class="form-control" id="stream_name" name="stream_name" value="{{ $livestream->name }}" readonly>
            </div>
        </div>
        <div class="col-md-6">
            <div class="mb-3">
                <label for="reportName" class="form-label">Name</label>
                <input type="text" class="form-control" id="reportName" name="name" value="{{ auth()->check() ? auth()->user()->firstName : '' }}" @if(auth()->check()) readonly @endif>
                <span id="reportNameError" class="text-danger"></span>
            </div>
        </div>
        <div class="col-md-6">
            <div class="mb-3">
                <label for="reportMobile" class="form-label">Mobile</label>
                <input type="text" class="form-control" name="mobile" id="reportMobile" value="{{ auth()->check() ? auth()->user()->phone : '' }}" @if(auth()->check()) readonly @endif>
                <span id="reportMobileError" class="text-danger"></span>
            </div>
        </div>
        <div class="col-md-6">
            <div class="mb-3">
                <label for="reportEmail" class="form-label">Email</label>
                <input type="email" class="form-control" id="reportEmail" name="email" value="{{ auth()->check() ? auth()->user()->email : '' }}" @if(auth()->check()) readonly @endif>
                <span id="reportEmailError" class="text-danger"></span>
            </div>
        </div>
        <div class="col-md-12">
            <div class="mb-3">
                <label class="form-label">Report For</label><br>
                @foreach(getReportOptions() as $key => $value)
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="report_for" id="{{ $key }}" value="{{ $key }}">
                    <label class="form-check-label" for="{{ $key }}">{{ $value }}</label>
                </div>
                @endforeach
                <span id="reportforError" class="text-danger"></span>
                
            </div>
        </div>

        <div class="col-md-12">
            <div class="mb-3">
                <label for="reportRemark" class="form-label">Remarks</label>
                <textarea class="form-control" id="reportRemark" name="remark" rows="2"></textarea>
                <span id="reportRemarkError" class="text-danger"></span>
            </div>
        </div>
    </div>
</form>

  </div>
  <div class="modal-footer">
      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      <button type="button" id="submit_report_form" class="btn btn-primary">Submit</button>
  </div>
</div>
</div>
</div>

