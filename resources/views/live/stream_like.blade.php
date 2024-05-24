@if(auth()->check())
    <div class="btn-group" role="group" aria-label="Like/Unlike">
        <!-- Like button -->
        <form action="{{ route('livestream.like', $livestream) }}" method="POST">
            @csrf
            <button type="submit" class="btn btn-success m-b-3" {{ auth()->user()->hasLikedLivestream($livestream) ? 'disabled' : '' }}>
                <i class="bx bx-like"></i> 
            </button>
        </form>
        <!-- Unlike button -->
        <form action="{{ route('livestream.unlike', $livestream) }}" method="POST">
            @csrf
            @method('DELETE')
            <button type="submit" class="btn btn-danger ms-2" {{  auth()->user()->hasUnlikedLivestream($livestream) ? 'disabled' : '' }}>
                <i class="bx bx-dislike"></i> 
            </button>
        </form>
    </div>
    <br>
    <!-- Display Like count -->
    <span>{{ $livestream->likeCount() }} Like{{ $livestream->likeCount() !== 1 ? 's' : '' }}</span>
    <!-- Display Unlike count -->
    <span>{{ $livestream->unlikeCount() }} Unlike{{ $livestream->unlikeCount() !== 1 ? 's' : '' }}</span>
@else
    <p>Please login to like/unlike this livestream.</p>
@endif
