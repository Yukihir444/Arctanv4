<?php 
    include_once'assets/conn.php'; 
    include'q.php';
?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php 
                                            $stmt = $dbcon->query("SELECT * FROM tbl_positions");
                                            $stmt->execute();
                                            $positions = $stmt->fetchAll();

                                            foreach($positions as $pst){
                                                echo $pst['position'];
                                            }
                                        ?>
</body>
</html>