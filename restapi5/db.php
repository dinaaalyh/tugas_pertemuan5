<?php
    $namaserver = "localhost";
    $userdb = "root";
    $passdb = "";
    $namadb = "dbkaryawan";
    $connection = mysqli_connect($namaserver, $userdb, $passdb, $namadb);

    if(!$connection){
        die("Koneksi ke database gagal" . mysqli_connect_error());
    }
?>