<div class="card bg-white w-75 mb-3 shadow-sm">
    <div class="card-body">
        <form action="" class="form-control border-0">
            <div class="row">
                <div class="col-1 px-0">
                    <a href="<?php echo $_SESSION['username']; ?>?current=<?php echo $_SESSION['username'] ?>">
                    <img src="<?php echo $web.$_SESSION['username']."/pic/".$user['profile_dir'] ?>" alt="" class="ratio-1x1 rounded-circle p-1float-start " width="50px" height="50px">
                    </a>
                </div>
                <div class="col ps-0">
                    <input class="form-control" type="text" placeholder="How is going on? //สร้างโพสต์ตรงนี้" id="inputtext">
                </div>
            </div>               
        </form>
    </div>
</div>