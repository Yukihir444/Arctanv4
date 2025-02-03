<?php @session_start();
    if(isset($_GET['search'])){
        $_SESSION['stage']="searching";
    }

    if(!isset($_SESSION['stage']) && !isset($_SESSION['playlist'])){
        include "createpost.php";
        include "feed.php";
    }else{
        switch ($_SESSION['stage']) {
            case 'searching':
                header("Location: ".$web."?search=".$_GET['search']."");
                include "search.php";
                unset($_SESSION['stage']);
                break;
            
            default:
                
                break;
        }
    }

    if(isset($_SESSION['playlist'])){ 
        include "playlist.php";
        }
?>