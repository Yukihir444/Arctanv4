<?php   
        $search = $_GET['search'];
        $type = $_GET['type'];
?>

<p class="fw-bold fs-4">Result<span class="fs-5 fw-normal">(s)</span> for "<?php echo $search ?>"</p>

<?php 
    if(isset($search) && !isset($type)) {
        include "search/searchPP.php";
    }else if(isset($search)&&$type=="position"){
        include "search/searchType.php";
    }else if($type=="band"){
        include "search/searchband.php";
    }


?>