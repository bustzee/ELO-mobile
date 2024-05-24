@extends('master')

@section('content')
    @include('slider')

    <div class="page-wrapper">
        <div class="page-content">
            @include('home_live_streams')

            @if (! $setting->hide_twitch_stream)
                <section class="py-4">
                    <div class="container" style="box-shadow: -90px 5px 35px -48px #01102b;">
                        <div class="d-flex align-items-center">
                            <h5 class="mb-0">Twitch Streams</h5>
                        </div>
                        <hr/>
                        <div class="row row-cols-1 row-cols-lg-3 row-cols-xl-4">
                            @if($twitchLivestreams->isNotEmpty())
                                @foreach ($twitchLivestreams as $elem)
                                    <div class="col">
                                        <a href="{{ route('specific_stream', ['id' => $elem['user_id']]) }}">
                                            <div class="card rounded-0">
                                                <div class="row g-0 align-items-center">
                                                    <div class="col-12">
                                                        <img src="{{ Str::replace('{width}x{height}', '251x141', $elem['thumbnail_url']) }}" class="card-img-top" alt="{{ $elem['title'] }}">
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="card-body mt-n101">
                                                            <p class="card-text text-ellipsis text-ellipsis fs-6">
                                                                {{ $elem['title'] }}
                                                                User Name: {{ $elem['user_name'] }}
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                @endforeach
                            @else
                                <p>No Twitch streams available.</p>
                            @endif
                        </div>
                    </div>
                </section>
            @endif

            @guest
                <section class="py-4">
                    <div class="container" style="box-shadow: -90px 5px 35px -48px #01102b;">
                        <div class="d-flex align-items-center">
                            <h5 class=" mb-3">Tutorial videos</h5>
                        </div>
                        <hr />
                        @include('tutorials_carousel',['page' => "4"])
                    </div>
                </section>
            @endguest
        </div>
    </div>

    @guest
        <div style="position: fixed; bottom: 20px; right: 20px;">
            <a href="{{ url('/register') }}">
                <img src="https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExbDJ2OW83cHp6dzBmeTkwc2FmM3NnZWhscmZodWozanV6MHpobDdhdSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9cw/QbVpDss4nolJFKcddg/giphy.gif" height="90px" />
            </a>
        </div>
    @endguest

@endsection

@section('js')
@endsection
