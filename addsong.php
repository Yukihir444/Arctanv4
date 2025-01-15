<?php @session_start(); require_once"assets/conn.php"; 
        if(isset($_POST['submit'])){
            $songname = $_POST['s_name'];
            $artist = $_POST['s_artist'];
            $songkey = $_POST['s_key'];
            $genre = $_POST['s_genre'];
            $composer = $_POST['s_composer'];
            if(!isset($_POST['isOG'])){
                $og = "No";
            }else{
                $og = $_POST['isOG'];
            }

            $sql = $dbcon->prepare("INSERT INTO tbl_songs(songname, artist, keyofsong, genre, original, composername) VALUES (:sname, :sartist, :skey, :sgenre, :og, :scomposer)");
            $sql->bindParam(":sname", $songname);
            $sql->bindParam(":sartist", $artist);
            $sql->bindParam(":skey", $songkey);
            $sql->bindParam(":sgenre", $genre);
            $sql->bindParam(":og", $og);
            $sql->bindParam(":scomposer", $composer);
            $sql->execute();

            if($sql){
                $_SESSION['success'] = "Completed.";
            }else{
                $_SESSION['error'] = "Not complete.";
            }
        }
            
?>
<html lang="en">
    <head>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    </head>

<div class="mx-auto w-50 my-3">
        <?php if(isset($_SESSION['success'])){ ?>
            <div class="alert alert-success"> 
                <?php   echo $_SESSION['success']; 
                        unset($_SESSION['success']); 
                        ?></div>
            <?php } ?>
        
        <?php 
        if(isset($_SESSION['error'])){ ?>
        <div class="alert alert-danger"> 
            <?php   echo $_SESSION['error']; 
                    unset($_SESSION['error']); 
                    ?></div>
        <?php } ?>


        <form class="form-control px-5 py-5" method="post" target="">
            <p class="fs-2 fw-bold">Add song</p>
            <div class="mb-3 row">
                <label for="inputsongname" class="col-sm-1 col-form-label" >Name:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="inputsongname" name="s_name" required>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="inputartist" class="col-sm-1 col-form-label" >Artist:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="inputartist" name="s_artist" required>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="inputkeys" class="col-sm-1 col-form-label">Key:</label>
                <div class="col-sm-5">
                    
                    <select  name="s_key" id="inputkeys" class="form-select">
                        <?php   
                                $stmt = $dbcon->query("SELECT * FROM tbl_keys");
                                $stmt->execute();
                                $keys = $stmt->fetchAll();

                                if(!$keys){
                                    echo "No key in database"; 
                                }else{
                                    foreach($keys as $k){
                                        $key = $k["k_major_name"]." / ".$k["k_minor_name"];
                                        echo "<option value=\"".$key."\">".$key." ( ".$k["k_scales"]." )</option>";
                                    }
                                }
                        ?>
                    </select>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="inputgenre" class="col-sm-1 col-form-label">Genre:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="inputgenre"  name="s_genre">
                </div>
            </div>
            <div class="mb-3 row">
                <label for="isOriginal" class="col-sm-1 col-form-label" >Original:</label>
                <div class="col-sm-5 my-auto">
                    <input class="form-check-input" type="checkbox" value="Yes" id="isOriginal" name="isOG" checked>
                </div>
            </div>
            <div class="mb-3 row">
                <label for="inputcomposer" class="col-sm-1 col-form-label" >Composer:</label>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="inputcomposer" name="s_composer">
                </div>
            </div>
            <div class="mb-3 ">
                <input type="submit" value="Add" class="btn btn-success " name="submit">
            </div>
        </form>
</div>