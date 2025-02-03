<?php 
    @session_start(); echo $_SESSION['username'];
    if(isset($_POST['addusername'])){
        $_SESSION['user'] = $_POST['user'];
        header("Location: ".$web);
    }


?>


<div class="container p-3 w-25">
    <div class="form-control p-4">
        <form action="" method="post">
            <input type="text" class="form-control my-2" placeholder="Type User..." name="user">
            <input type="submit" class="btn btn-primary" name="addusername">
        </form>

    </div>
</div>