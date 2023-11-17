<?php
    header('Access-Control-allow-Origin: *');
    include('db.php');

    $id = $_POST['id'];
    $name = $_POST['name'];
    $address = $_POST['address'];
    $salary = $_POST['salary'];

    $result = mysqli_query($connection, "UPDATE employees SET name='$name', address='$address', salary='$salary' WHERE id='$id'");

    if($result){
        echo json_encode([
            'message' => 'Success'
        ]);
    }else{
        echo json_encode([
            'message' => 'Failed'
        ]);
    }
?>