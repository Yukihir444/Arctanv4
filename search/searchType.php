<div class="" id="results">
    <div class="mx-3">
        <?php 
            if($type = "position"){
                $sql = $dbcon->prepare("SELECT b.band_name,profile_dir, username, displayname, pst.position FROM tbl_users u  LEFT JOIN tbl_members_band m ON m.USERID = u.USERID LEFT JOIN tbl_positions pst on pst.TYPEID = m.TYPEID LEFT JOIN tbl_bands b ON b.BANDID = m.BANDID WHERE position = :sch ");
                $sql->bindParam(":sch", $search, PDO::PARAM_STR);
                $sql->execute();
                $result = $sql->fetchAll();
                
                if(!$result){
                    echo "<div class=\"text-center fs-6\">-- No Position Found -- </div>";
                }else{ ?>
                <div class="text-secondary">People</div>
                    <?php
                    foreach($result as $target){
                    
                    ?>
                    <div class="card my-1 shadow-sm">
                        <div class="card-body">
                        <div class="row "> 
                                <div class="col-1 ">
                                    <a href="<?php echo $target['username'] ?>" >
                                    <img src="<?php echo $web.$target['username']?>/pic/<?php echo $target['profile_dir'] ?>" alt="" class="ratio-1x1 rounded-circle p-1 float-start " width="60px" height="60px">
                                    </a>
                                </div>
                                <div class="col ps-0 ">
                                    <div class="row ">
                                        <span>
                                        <a href="<?php echo $target['username']; ?>" class="text-decoration-none fw-bold fs-4 text-dark">
                                            <?php echo $target['displayname']; ?>
                                            <span class="text-secondary fw-lighter fs-6 text-top"><?php echo "@".$target['username'] ;?></span></a> 
                                        <?php 
                                        
                                        if($_SESSION['username'] == $target['username'] || $_SESSION['username'] == strtolower($target['displayname'])){ 
                                            
                                        }else{ ?>
    
                                            <button class="btn btn-outline-primary ms-2 btn-sm">Follow +</button>
                                            
                                        <?php } ?>
                                        </span>
                                        <label for="Content" class="text-secondary "><a class="text-decoration-none text-secondary icon-link icon-link-hover fw-semibold" href="<?php echo $web."?search=".$target['position']."&type=position\">".$target['position']." </a> . "
                                        .$target['band_name'] ?> </label>
                                    </div>
                                </div>
                                
                        </div>  
                        </div>
                    </div>
                <?php 
                    }
                } 
            }
        ?>
    </div>
</div>