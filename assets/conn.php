<?php @session_start();
$web = "http://localhost/Arctanv4/";
$_SESSION['dir'] = $web;

$servername = "localhost";
$userName = "root";
$userPass = "rootroot";
$dbname = "arctan";

try{
    $dbcon = new PDO("mysql:host=$servername;dbname=$dbname", $userName, $userPass);
    $dbcon->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
    echo "Failed to connect to databae".$e->getMessage();
}



?>