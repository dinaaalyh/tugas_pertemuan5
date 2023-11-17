<?php
    header('Access-Control-allow-Origin: *');
    include "db.php";

    $name = $_POST['name'];
    $address = $_POST['address'];
    $salary = $_POST['salary'];
    
    $result = mysqli_query($connection, "INSERT INTO employees SET name='$name', address='$address', salary='$salary'");

    if($result){
        echo json_encode([
            'message' => 'success'
        ]);
    }else{
        echo json_encode([
            'message' => 'failed'
        ]);
    }
?>