<?php

$conn = require("../Database/SelectDatabase.php");

$query = "DELETE FROM orderhistory";
mysqli_query($conn, $query);

$query = "ALTER TABLE orderhistory AUTO_INCREMENT = 1";
mysqli_query($conn, $query);

$query = "DELETE FROM user";
mysqli_query($conn, $query);

$query =
    "INSERT INTO user (Username, Password)
    VALUES ('Admin', 'admin')
";
mysqli_query($conn, $query);

sleep(0.75);

header('Location: http://localhost/PCBuilder/Database/');
