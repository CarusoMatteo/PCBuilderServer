<?php

$conn = require("../Database/SelectDatabase.php");

$username = $_GET["Username"];
$password = $_GET["Password"];

$query =
    "SELECT EXISTS 
    (SELECT * 
    FROM user
    WHERE Username = '$username' AND Password = '$password'
    ) AS ris
";

$json = mysqli_fetch_array(mysqli_query($conn, $query));

mysqli_close($conn);

$json = json_encode($json);
print($json);