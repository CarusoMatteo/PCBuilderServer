<?php

$conn = require("../Database/SelectDatabase.php");

$id = $_GET["Id"];

$query =
    "SELECT *
    FROM storage
    WHERE storage.IdStorage = '$id'
";

// print($query . "<br>");

try {
    $result = mysqli_fetch_assoc(mysqli_query($conn, $query));
} catch (Exception $e) {
    print($e);
    $result = array("Success" => false);
}

mysqli_close($conn);

if ($result == null) {
    $result = array("Success" => false);
}

$json = json_encode($result);
print($json);