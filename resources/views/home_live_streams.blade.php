<style type="text/css">
    .card-img-top {
        height: 200px; /* Adjust as needed */
        object-fit: cover;
    }
</style>
<section class="py-4">
    <div class="container" style="box-shadow: -90px 5px 35px -48px #01102b;">
        <div class="d-flex align-items-center">
            <h5 class=" mb-3">Live Streams</h5>
        </div>

        <hr />

        <div class="row row-cols-1 row-cols-lg-3 row-cols-xl-4 overflow-auto" style="overflow:auto;">
            @foreach($livestreams as $livestream)
                 <div class="col-md-3 mb-3">
                    <a href="{{ route('stream.live', [$livestream->id]) }}" class="card-link">
                        <div class="card">
                        @if ($livestream->image)
    {{-- Use the livestream image path --}}
    <img src="{{ asset('images/' . $livestream->image) }}" class="card-img-top" alt="Image 1">
@else
    {{-- Fallback to the logo image path if livestream image is not available --}}
    <img src="{{ asset('assets/front/images/logo.png') }}" class="card-img-top" alt="Image 1">
@endif
                            <div class="card-body">
                                <h5 class="card-title">{{ $livestream->name }}</h5>
                               
                            </div>
                        </div>
                    </a>
                </div>
            @endforeach

        </div>
    </div>
</section>
