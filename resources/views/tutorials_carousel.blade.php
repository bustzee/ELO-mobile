 <div class="row">
    <div class="col mb-2">
  <div class="d-flex justify-content-end align-items-center">
    <div id="carouselControls" class="carousel-controls">
      <button class=" custom-prev-btn" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class=" custom-next-btn" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </div>
</div>
</div>



<div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
<div class="carousel-inner">
 @foreach($tutorials->chunk($page) as $key => $chunk)   
  <div class="carousel-item {{ ($key == 0)?'active':'' }}">
    <div class="row">
    @foreach($chunk as $item)
      <div class="col">
            <div class="card">
              @if (!empty($item->tutorial_url))  
              <div class="embed-responsive">
                
                    <iframe class="embed-responsive-item" width="100%" src="https://www.youtube.com/embed/{{ getYouTubeId($item->tutorial_url) }}" allowfullscreen></iframe>    
                
                
              </div>
              @else
               <a href="{{ asset('tutorial-document/'.$item->id) }}" target="_new">
                 <img src="{{ asset('assets/front/images/pdf-image.png') }}" class="img-fluid">
               </a>  
              @endif
              <div class="card-body">
                <h5 class="card-title">
                     @if (!empty($item->tutorial_url))  
                     <a href="#" class="video-link" data-toggle="modal" data-target="#videoModal" data-video-id="{{ $item->tutorial_url }}">
                    {{ $item->name }}
                    </a>
                    @else
                     <a href="{{ asset('tutorial-document/'.$item->id) }}" target="_new">
                         {{ $item->name }}
                      </a>   
                    @endif
                </h5>
                <p class="card-text">{{ $item->description }}</p>
              </div>
            </div>
      </div>
    @endforeach
    </div>
  </div>
  <!-- Add more carousel items as needed -->
@endforeach


</div>
</div>


<div class="modal fade" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="videoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="videoModalLabel">YouTube Video</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
             
            </div>
            <div class="modal-body">
                <div id="videoContainer"></div>
            </div>
        </div>
    </div>
</div>



 <style>


/* Custom styles for carousel */
.carousel-item img {
    max-height: 350px;
    margin: auto;
    background: transparent;
}

.carousel-inner .active {
    background-color:transparent; !important;
}

.custom-prev-btn,
.custom-next-btn {
    background: transparent; /* Change background color */
    color: #fff; /* Change text color */
    border: none; /* Remove border */
    border-radius: 20%; /* Make it round */
    width: 40px; /* Adjust width */
    height: 40px; /* Adjust height */
    font-size: 1.5rem; /* Adjust font size */
}

  </style>


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

    function myFunctionCopy() {
        var copyText = document.getElementById("myInputCopy");

        copyText.select();
        copyText.setSelectionRange(0, 99999);
        navigator.clipboard.writeText(copyText.value);
        alert("Copied the text: " + copyText.value);
    }
</script>


