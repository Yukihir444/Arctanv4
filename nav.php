<nav class="sticky-top navbar navbar-expand-lg navbar-dark bg-dark ">
        <div class="mx-auto w-50">
            <div class="container-fluid">
                <div class="collapse navbar-collapse " id="navbarScroll">
                    <a class="navbar-brand fw-semibold " href="<?php echo $web ?>" onclick="">ARCTAN</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <?php if(!isset($_SESSION['playlist'])){ ?>
                    <div class="navbar-nav my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
                        <a href="<?php echo $web."playlist" ?>" class="text-light mx-1 navbar-brand fs-6 icon-link icon-link-hover">| My Playlist</a>
                    </div>
                    <?php  }else{ ?>
                        <div class="navbor-brand text-light">Playlist</div>
                    <?php } ?>
                    <div class="w-100">
                        <form class="d-flex w-100 ps-5"  method="get">
                            <input class="form-control me-2 fst-italic" type="search" placeholder="Find People in ARCTAN" aria-label="Search" name="search">
                            <button class="btn btn-outline-success" type="submit" >Search</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>  
    </nav>