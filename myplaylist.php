<?php @session_start(); include_once'assets/conn.php'; include'q.php'
?>

<div class="card-body">
    <div class="card" >
    <ul class="list-group list-group-flush">
        <li class="list-group-item d-flex w-100 ">
            <div class="col text-center mx-1 fw-semibold">Song</div> <div class="vr"></div>
            <div class="col text-center mx-1 fw-semibold">Key Signature</div> <div class="vr"></div>
            <div class="col text-center mx-1 fw-semibold">Artist</div> <div class="vr"></div>
            <div class="col text-center mx-1 fw-semibold">Genre</div>
        </li>
        
    <?php 

$u=1;
    $stmt = $dbcon->prepare("SELECT * FROM playlist WHERE USERID = :u");
    $stmt->bindParam(":u", $user['USERID']);
    $stmt->execute();
    $song = $stmt->fetchAll();

    if(!$song){
        echo "<li class=\"list-group-item d-flex \"><div class=\"text-center mx-1 w-100\">No playlist</div></li>";
    } else {
        $sql = "SELECT s.songid, songname, keyofsong, artist, genre FROM tbl_users u LEFT JOIN playlist p ON u.userid= p.userid LEFT JOIN tbl_songs s ON p.songid = s.songid WHERE u.userid=:u";
        $stmt = $dbcon->prepare($sql);
        $stmt->bindParam(":u", $u, PDO::PARAM_INT);
        $stmt->execute();
        $songlist = $stmt->fetchAll();
    
        if(!$songlist){
            echo "somgthing went wrong";
        } else { 
           
            foreach($songlist as $pl){
                ?>
                    <li class="list-group-item d-flex w-100 ">
                     <div class="col text-center mx-1">
                        <a href="?songname=<?php echo $pl['songname'] ?>" class="text-decoration-none link-dark"><?php echo $pl['songname'] ?> </a>
                     </div>
                     <div class="col text-center mx-1">
                        <a href="?keyofsong=<?php echo $pl['keyofsong'] ?>" class="text-decoration-none link-dark"><?php echo $pl['keyofsong'] ?></a>
                     </div>
                     <div class="col text-center mx-1">
                        <a href="?artist=<?php echo $pl['artist'] ?>" class="text-decoration-none link-dark"><?php echo $pl['artist'] ?></a>
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
</div>