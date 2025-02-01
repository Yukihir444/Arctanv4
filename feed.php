            <!-- Feed -->
            <div class="text-center">Feed เฉพาะที่ Follow ไว้ หรืองานที่ตรงกัน</div>
            <?php   $sql = $dbcon->query("SELECT POSTID, e_date, e_time_start, e_time_end, e_price, e_price_add , e_place , e_detail, e_status , position_type, timestamp, username, displayname, `status`, online_status, profile_dir FROM tbl_post p LEFT JOIN tbl_users u on u.USERID = p.UID");
                    $sql->execute();
                    $post = $sql->fetchAll();

                    foreach($post as $p){
            ?>
            <div class="card bg-white w-75 mb-3 shadow-sm ">
                <div class="card-body ">
                    <div class="row ">
                        <!-- Display Name -->
                        <div class="col-1 ">
                            <a href=" <?php echo $web."/".$p['username']."?current=".$p['username'] ?>">
                                <img src="<?php echo $web."/".$p['username']."/pic/".$p['profile_dir'] ?>" alt=""
                                    class="ratio-1x1 rounded-circle p-1 float-start " width="50px" height="50px">
                            </a>
                        </div>
                        <div class="col ps-0 ">
                            <div class="row">
                                <span><a href=" <?php echo $web."/".$p['username']."?current=".$p['username'] ?>"
                                        class="text-decoration-none fw-bold fs-6 text-dark"><?php echo $p['displayname'] ?></a>
                                    <button class="btn btn-outline-primary ms-2 btn-sm">Follow +</button></span>
                                <label for="Content"
                                    class="text-secondary fs-6"><?php echo date('j M Y G:m',strtotime($p['timestamp'])) ?></label>
                            </div>
                        </div>
                        <div class="col-1 text-center fw-semibold">
                            <span>...</span>
                            <!-- <span>x</span> -->
                        </div>
                    </div>
                    <!-- Content -->
                    <div class="row px-4 pt-3">
                        <div class="col">
                            <p class="align-middle fw-semibold fs-6 my-0  mx-3">
                                <?php echo date('D j',strtotime($p['e_date']))." ".date('M Y',strtotime($p['e_date'])) ?>
                            </p>
                            <p class="align-middle fw-semibold fs-6 my-0  mx-3">
                                <?php echo $p['e_time_start']." - ".$p['e_time_end'] ?> <span
                                    class=" text-secondary fw-normal fs-6"> | ( 60m / 45m / 60m )</span></p>
                        </div>
                        <div class="col text-end">
                            <p class="fw-bold fs-1"><?php echo number_format($p['e_price']) ?></p>
                            <p class="fw-semibold"><?php echo $p['position_type'] ?> </p>
                        </div>
                    </div>

                    <!-- <div class="row px-4 pt-3">
                        <div class="col text-center">
                            <button type="button" class="btn btn-outline-primary mb-1 fw-semibold w-100" disabled>FRI 13</button>
                            <button type="button" class="btn btn-outline-dark mb-1 fw-semibold w-100" disabled>JUNE 2024</button>
                        </div>
                        <div class="col">
                            <p class="fw-semibold text-center">23.00 - 01.45</p>
                            <p class="fw-semibold text-center">Terra No.1</p>
                        </div>
                        <div class="col">
                            <p class="fw-semibold fs-4 text-center">Bass </p>

                        </div>
                        <div class="col">
                            <p class="fw-bold fs-2">฿1,700</p>
                        </div>
                    </div>   -->
                    <hr class="Dropdown-divider  mb-1" />
                    <div class="row">
                        <div class="col text-center text-secondary fw-semibold ">Like</div>
                        <div class="col text-center text-secondary fw-semibold">Comment</div>
                        <div class="col text-center text-secondary fw-semibold">Share</div>
                    </div>
                </div>
            </div>
            <?php };?>
            <div class="text-center">---------- No more feed -------------</div>