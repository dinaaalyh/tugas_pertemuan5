<?php
    header('Access-Control-allow-Origin: *');
    include('db.php');

    $id = $_POST['id'];
    $result = mysqli_query($connection, "DELETE FROM employees WHERE id='$id'");

    if($result){
        echo json_encode([
            'Message' => 'Success'
        ]);
    }else{
        echo json_encode([
            'Message' => 'Failed'
        ]);
    }
?>