<div class="" id="results">
    <div class="mx-3">
        <?php 
            if($type = "band"){
                $sql = $dbcon->prepare("SELECT * FROM tbl_bands WHERE band_name = :sch ");
                $sql->bindParam(":sch", $search, PDO::PARAM_STR);
                $sql->execute();
                $result = $sql->fetchAll();
                
                if(!$result){
                    echo "<div class=\"text-center fs-6\">-- No Position Found -- </div>";
                }else{ ?>
                <div class="text-secondary">Band</div>
                    <?php
                    foreach($result as $target){
                    
                    ?>
                    <div class="card my-1 shadow-sm">
                        <div class="card-body">
                        <div class="row "> 
                                <div class="col-1 ">
                                    <a href="<?php echo $target['BANDID'] ?>" >
                                    <img src="<?php echo $web."/assets/img/none.jpeg"; ?>" alt="" class="ratio-1x1 rounded-circle p-1 float-start " width="60px" height="60px">
                                    </a>
                                </div>
                                <div class="col ps-0 ">
                                    <div class="row ">
                                        <span>
                                        <a href="<?php echo $target['band_name']; ?>" class="text-decoration-none fw-bold fs-4 text-dark">
                                            <?php echo $target['band_name']; ?>
                                            <span class="text-secondary fw-lighter fs-6 text-top"><?php echo "@".$target['band_name'] ;?></span></a> 
                                        <?php 
                                        
                                        if($_SESSION['username'] == $target['band_name'] || $_SESSION['username'] == strtolower($target['band_name'])){ 
                                            
                                        }else{ ?>
    
                                            <button class="btn btn-outline-primary ms-2 btn-sm">Follow +</button>
                                            
                                        <?php } ?>
                                        </span>
                                        <label for="Content" class="text-secondary ">
                                            <?php 
                                            $bandid = $target['BANDID'];
                                            $sql = $dbcon->query("SELECT * FROM tbl_members_band WHERE BANDID =".$bandid);
                                            $r = $sql->fetchColumn();
                                            echo $r;
                                            ?> members</label>
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