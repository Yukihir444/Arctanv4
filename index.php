<?php @session_start(); 
        
        include_once'assets/conn.php'; 
        include'q.php';
        unset($_SESSION['playlist']);
        date_default_timezone_set('Asia/Bangkok');
        
        if(isset($_GET['action'])){
            if($_GET['action']="clear"){
            session_destroy();
            header("Refresh:0;url=".$_SESSION['dir']);
            }
        }
        
        ?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <link rel="icon" type="image/x-icon" href="assets/img/logo.ico">
        <title>ARCTAN V4</title>
    </head>

    <?php
    if(!$_SESSION['user']){
        include_once 'test-authur.php';
    }else{ ?>

<body>
    <?php include_once"nav.php"; ?> 
<div class="container-xxl bd-gutter mt-3 my-md-4">
    <div class="row">
    <aside class=" bd-sidebar col-md-2 pe-4">
            <div class="offcanvas-lg offcanvas-start">
                <div class="offcanvas-body ">
                    
                            
                </div>
            </div>
            <!-- <hr class="Dropdown-divider w-100"> -->
        </aside>
                        <!---------------------------------------- Left side bar --------------------------------------------------------->
        <!-- <aside class=" bd-sidebar col-md-2 pe-4">
            <div class="offcanvas-lg offcanvas-start">
                <div class="offcanvas-body ">
                    <form class="d-flex " action="?" method="get">
                        <div class="input-group ">
                            <div class="row ">
                            <div class="row w-100">
                                <div class="form-floating gx-0 gb-2">
                                    <select class="form-select" id="floatSelected" name="catagery">
                                        <option value="0" selected>Catagery</option>
                                        <option value="1">Solo</option>
                                        <option value="2">Duo</option>
                                        <option value="3">Trio</option>
                                        <option value="3">Band</option>
                                    </select>
                                    <label for="floatSelected">Catagery</label>
                                </div>
                            </div>    
                            <div class="row">
                                <div class="form-floating  gx-0 gy-2">
                                    <select class="form-select" id="floatSelected" name="position">
                                        <option selected value="">--- Position ---</option>
                                        <?php 
                                            $stmt = $dbcon->query("SELECT * FROM tbl_positions");
                                            $stmt->execute();
                                            $positions = $stmt->fetchAll();

                                            foreach($positions as $pst){
                                                echo "<option value=\"".$pst['position']."\">".$pst['position']."</option>";
                                            }
                                        ?>
                                    </select>
                                    <label for="floatSelected">Position</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-floating  gx-0 gy-2">
                                    <select class="form-select" id="floatSelected" name="province">
                                        <option selected value="0">Province</option>
                                        
                                    </select>
                                    <label for="floatSelected">Province</label>
                                </div>
                            </div>
                            <button class="btn btn-outline-warning mt-3" type="submit">Search</button>
                            
                            
                        </div>
                        </div>
                    </form>
                </div>
            </div>
            <hr class="Dropdown-divider w-100">
        </aside> -->

                                        <!------------------------------------- Main Content ------------------------------------------>
        <main class="bd-main order-1 col-md-10 ">
            <?php echo $_SESSION['user'] ?>
                <!------------------------------ New -------------------------------------->
                <?php include "condition.php"  ?>

        </main>
    </div>
</div>
</body>

</html>
<?php } ?>