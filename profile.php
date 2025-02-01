<?php @session_start(); require_once "assets/conn.php"; 
        
    
            if(isset($_GET['current'])){
                if($_GET['current']===$_SESSION['username']){
                    $_SESSION['w'] = $_SESSION['username'];
                    header("location:".$web.$_SESSION['w']);
                }else{
                    $_SESSION['w'] = $_GET['current'];
                    header("location:".$web.$_SESSION['w']);
                }
            }


    $curr = $_SESSION['w'];
    $sql = $dbcon->query("SELECT username, u.USERID, profile_dir, displayname 
                            FROM tbl_users u 
                            LEFT JOIN tbl_skills sk ON u.USERID = sk.USERID 
                            LEFT JOIN tbl_members_band m ON m.USERID = u.USERID
                            LEFT JOIN tbl_positions pst ON sk.TYPEID = pst.TYPEID 
                            LEFT JOIN tbl_post p ON p.UID = u.USERID
                            LEFT JOIN playlist pl ON pl.USERID = u.USERID
                            LEFT JOIN tbl_songs s ON s.SONGID = pl.SONGID 
                            LEFT JOIN tbl_follows f ON f.follower = u.USERID
                            WHERE username = '".$curr."'");
    $sql->execute();
    $cc = $sql->fetchAll();
    
        foreach($cc as $c){ 
        }

    $_SESSION['target'] = $c['USERID'];
    ?>
<body>
    <?php include_once"nav.php";  
    ?>
    <div class="container ">
        <div class="card shadow-sm w-100 mt-3 h-100">
        <div class="user ">
            <div class="profile mt-5 mb-2 mx-4">
                <div class="row ">
                    <div class="col">
                    <img src="<?php echo $web.$c['username'].'/pic/'.$c['profile_dir']; ?> " class="rounded-circle img-thumbnail" width="180px">
                    </div>
                        <div class="col-10 mt-auto">
                            <div class="row" >
                                <p class="fs-2 fw-bold align-text-bottom"> <?php echo $c['displayname']; ?><span class="fw-light fst-italic ms-3 text-muted">@<?php echo $c['username'] ?> 
                                <?php  if($_SESSION['username']!==$c['username']){ ?>
                                    <button class="btn btn-outline-primary ms-2 btn-sm">Follow +</button>
                                <?php } ?>
                            </span></p>
                            </div>
                            <div class="row mb-0">
                                <p class="text-secondary">2.4k Followers | 500 Following</p>
                            </div>
                        </div>
                </div>
                <hr class="w-100  mx-auto">
                <div class="row">
                    <div class="d-flex justify-content-between align-items-center mt-4 px-4">
                        <div class="col text-center align-text-middle my-auto"><p class="fw-bold"></p><p class="fs-1 fw-bold">BANGKOK</p></div><div class="vr mb-3 opacity-1"></div>
                        <div class="col text-center align-text-middle my-auto"><p class="fw-bold">RANK</p><p class="fs-1 fw-bold">A</p></div><div class="vr mb-3 opacity-25"></div>
                        <div class="col text-center align-text-middle my-auto"><p class="fw-bold">MATCH</p><p class="fs-1 fw-bold">80%</p></div>                       
                    </div>
                </div>             
            </div>
        </div>
    </div>
    <div class="card my-3 ">
        <div class="card-body">
        <nav>
            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <button class="nav-link link-secondary fw-bold active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-post" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Post</button>
                <button class="nav-link link-secondary fw-bold" id="nav-sche-tab" data-bs-toggle="tab" data-bs-target="#nav-sche" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Schedule</button>
                <button class="nav-link link-secondary fw-bold" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-list" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">List</button>
                <button class="nav-link link-secondary fw-bold" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</button>
            </div>
        </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-post" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                    <?php include_once"fetchpost.php" ?>
                </div>
                <div class="tab-pane fade" id="nav-list" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
                    <?php include_once"myplaylist.php"?>
                </div>
                <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">
    Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolores earum deleniti, quos et amet neque rerum quam est libero corrupti commodi qui voluptate adipisci voluptates, ratione labore rem placeat quidem ipsam iure. Quam laborum exercitationem maiores nisi, nemo eius voluptatum architecto quod nostrum aut ut modi distinctio molestias quas deserunt.
                </div>
                <div class="tab-pane fade" id="nav-sche" role="tabpanel" aria-labelledby="nav-sche-tab" tabindex="0">
                    Schedule
                </div>

            </div>
        </div>
    </div>    
</div>
</body>
