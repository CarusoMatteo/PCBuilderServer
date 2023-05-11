<?php

$conn = require("../Database/SelectDatabase.php");

$username = $_GET["Username"];
$componentType = $_GET["ComponentType"];
$componentID = $_GET["ComponentID"];

switch ($componentType) {
    case '0':
        $attribute = "CPU";
        break;
    case '1':
        $attribute = "Motherboard";
        break;
    case '2':
        $attribute = "RAM";
        break;
    case '3':
        $attribute = "GPU";
        break;
    case '4':
        $attribute = "Storage";
        break;
    case '5':
        $attribute = "PSU";
        break;
    default:
        $attribute = "NotValid";
        break;
}

$query =
    "UPDATE user
    SET $attribute = $componentID
    WHERE Username = '$username'
";

// print($query . "<br>");

$result = array("UpdateSuccessful" => true);

try {
    mysqli_query($conn, $query);
} catch (Exception $e) {
    // print($e);
    $result["UpdateSuccessful"] = false;
}

mysqli_close($conn);

$json = json_encode($result);
print($json);

// EXAMPLE:
// AddToCart.php?Username="Admin"&ComponentType=0&ComponentID=null

// QUERY:
// UPDATE user 
// SET CPU = null 
// WHERE Username = "Admin"

// RESULTING JSON:
// {"UpdateSuccessful":true}