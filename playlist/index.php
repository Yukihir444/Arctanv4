<?php @session_start(); require_once "../assets/conn.php"; include "../head.php"; include "../q.php"; $_SESSION['playlist']=""; ?>
<body>
    <?php include "../nav.php";?>

    <div class="container-xxl bd-gutter mt-3 my-md-4">
    <div class="row">
                        <!---------------------------------------- Left side bar --------------------------------------------------------->
        <aside class=" bd-sidebar col-md-2 pe-4">
            <div class="offcanvas-lg offcanvas-start">
                <div class="offcanvas-body ">
                    
                            
                </div>
            </div>
            <!-- <hr class="Dropdown-divider w-100"> -->
        </aside>

        <main class="bd-main order-1 col-md-10 ">
                <!------------------------------ New -------------------------------------->
                <?php include "../condition.php"  ?>
        </main>


</body>