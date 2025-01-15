<div class="card-body my-2 mx-auto">
    <div class="card" >
    <ul class="list-group list-group-flush">
        <li class="list-group-item d-flex w-100 ">
            <div class="col-1 text-center mx-1 fw-semibold ">#</div> <div class="vr"></div>
            <div class="col-5 text-center ms-5 fw-semibold ">Song</div> <div class="vr"></div>
            <div class="col-1 text-center mx-1 fw-semibold ">Key Signature</div> <div class="vr"></div>
            <div class="col-3 text-center ms-1 fw-semibold ">Artist</div> <div class="vr"></div>
            <div class="col text-center mx-1 fw-semibold ">Genre</div>
        </li>
        
    <?php 


    $stmt = $dbcon->prepare("SELECT * FROM playlist WHERE USERID = :u");
    $stmt->bindParam(":u", $user['USERID']);
    $stmt->execute();
    $song = $stmt->fetchAll();

    if(!$song){
        echo "<li class=\"list-group-item d-flex \"><div class=\"text-center mx-1 w-100\">No playlist</div></li>";
    } else {
        $sql = "SELECT s.songid, songname, keyofsong, artist, genre FROM tbl_users u LEFT JOIN playlist p ON u.userid= p.userid LEFT JOIN tbl_songs s ON p.songid = s.songid WHERE u.userid=:u";
        $stmt = $dbcon->prepare($sql);
        $stmt->bindParam(":u", $user['USERID'], PDO::PARAM_INT);
        $stmt->execute();
        $songlist = $stmt->fetchAll();
    
        if(!$songlist){
            echo "somgthing went wrong";
        } else { 
            $i =1;
            foreach($songlist as $pl){
                ?>
                    <li class="list-group-item d-flex w-100 ">
                    <div class="col-1 text-center mx-1 fw-normal"><?php echo $i++?></div> 
                     <div class="col-5 ms-5">
                        <a href="?songname=<?php echo $pl['songname'] ?>" class="text-decoration-none link-dark fw-bold text-truncate"><?php echo $pl['songname'] ?> </a>
                     </div>
                     <div class="col-1 text-center mx-1">
                        <a href="?keyofsong=<?php echo $pl['keyofsong'] ?>" class="text-decoration-none link-dark"><?php echo $pl['keyofsong'] ?></a>
                     </div>
                     <div class="col-3 ms-4">
                        <a href="?artist=<?php echo $pl['artist'] ?>" class="text-decoration-none link-dark text-truncate"><?php echo $pl['artist'] ?></a>
                     </div>
                     <div class="col text-center mx-1">
                        <a href="?genre=<?php echo $pl['genre'] ?>" class="text-decoration-none link-dark"><?php echo $pl['genre'] ?></a>
                     </div>
                     </li>   
                        
            <?php } ?>
            
        <?php
        }
    }


 ?>

    </ul>
    </div>