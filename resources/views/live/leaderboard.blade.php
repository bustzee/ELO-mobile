@extends('master')

@section('content')
<style type="text/css">
    .card-img-top {
        height: 200px; /* Adjust as needed */
        object-fit: cover;
    }
</style>

<div class="page-wrapper">
    <div class="page-content">
        <div class="container py-4">
            <div class="d-flex align-items-center">
                <h5 class="mb-3">Home Leaderboard</h5>
            </div>
            <hr />

            @if(count($livestreams) > 0 || isset($leaderboardLivestreams))
            <div class="row">
                <!-- Display existing livestreams -->
                @foreach($livestreams as $livestream)
                <div class="col-md-3 mb-3">
                    <a href="{{ route('stream.live', [$livestream->id]) }}" class="card-link">
                        <div class="card">
                            <img src="images/{{ $livestream->image }}" class="card-img-top" alt="Image 1">
                            <div class="card-body">
                                <h5 class="card-title">{{ $livestream->name }}</h5>
                                <p class="card-text">{{ trim_text($livestream->description) }}</p>
                            </div>
                        </div>
                    </a>
                </div>
                @endforeach
                <div class="d-flex align-items-center">
                <h5 class="mb-3">Twitch Leaderboard</h5>
            </div>
            <hr />
                <!-- Display Twitch livestreams from API -->
                @if(isset($leaderboardLivestreams))
                @foreach($leaderboardLivestreams as $leaderboardLivestream)
                <div class="col-md-3 mb-3">
                    <a href="{{ route('specific_stream', ['id' => $leaderboardLivestream['user_id']]) }}" class="card-link">
                        <div class="card">
                        @php
                        // Replace {width} and {height} with specific values
                        $thumbnailUrl = str_replace(['{width}', '{height}'], ['300', '200'], $leaderboardLivestream['stream']['thumbnail_url']);
                    @endphp

                    {{-- Display the thumbnail image --}}
                    <img src="{{ $thumbnailUrl }}" class="card-img-top" alt="Twitch Stream Thumbnail">
                    
                            <div class="card-body">
                          
                            <p class="card-text text-ellipsis text-ellipsis fs-6">
                            {{ $leaderboardLivestream['stream']['title'] }}
                                             
                                            </p>
                                {{--<h5 class="card-title">{{ $leaderboardLivestream['stream']['user_name'] }}</h5>--}}
                                <!-- You can customize the display based on Twitch stream data -->
                                <p class="card-text">Viewers: {{ $leaderboardLivestream['stream']['viewer_count'] }}</p>
                                <p class="card-text">Likes: {{ $leaderboardLivestream['like_count'] }}</p>
                                <p class="card-text">Pot Amount: {{ $leaderboardLivestream['pot_amount'] }}</p>
                                
                            </div>
                        </div>
                    </a>
                </div>
                @endforeach
                @endif
            </div>
            @else
            <p>No livestreams found!</p>
            @endif
            <div class="col-md-2">



        </div>
    </div>
</div>
@endsection

@section('js')
<!-- Add any JavaScript scripts here if needed -->
@endsection
