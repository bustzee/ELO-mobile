<footer class="d-none1">
    <section class="py-41 bg-dark-blue2">
        <div class="container">
            <hr />

            <div class="row row-cols-1 row-cols-md-2 align-items-center">
                <div class="col-md-8">
                    <div class="logo d-none1 d-lg-flex">
                        <a href="/">
                            <img src="{{ asset('assets/front/images/logo.png') }}" class="logo-icon" alt="logo" />
                        </a>
                    </div>
                </div>

                <div class="col-md-4">
                    <p class="mb-0">Copyright © 2023. All rights reserved.</p>
                </div>
            </div>
        </div>
    </section>
</footer>

 <style>
        /* Custom CSS to position the button */
        .bottom-right-corner {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 1000; /* Ensure button appears above other content */
        }

        /* Custom CSS for blinking animation */
         @keyframes blink {
            0% { background-color: #007bff; } /* Bootstrap primary color */
            50% { background-color: #28a745; } /* Another color */
            100% { background-color: #007bff; } /* Back to Bootstrap primary color */
        }

         .blink-text {
            animation: blink 5s infinite;
        }
    </style>