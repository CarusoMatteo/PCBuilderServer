<?php

$conn = require("SelectDatabase.php");

$username = $_GET["Username"];
$password = $_GET["Password"];

$query =
    "INSERT INTO utenti (Username, Password)
    VALUES ('$username', '$password')
";

$result = array("UsernameAlreadyUsed" => false);

try {
    mysqli_query($conn, $query);
} catch (Exception $e) {
    //print($e);
    $result["UsernameAlreadyUsed"] = true;
}

mysqli_close($conn);

$json = json_encode($result);
print($json);