<?php
@session_start(); 
$name = $_SESSION['user'];
$sql = "SELECT * FROM tbl_users WHERE username = :uname ";
$query = $dbcon->prepare($sql);
$query->bindParam(":uname", $name, PDO::PARAM_STR);
$query->execute();
$users = $query->fetchAll();
if (!$users) {
    
} else {
    foreach ($users as $user);
    $pic_path = $user['username'] . "/pic/" . $user['profile_dir'];
    $_SESSION['username'] = $user['username'];
} 
    ?>