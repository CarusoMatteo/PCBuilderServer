<?php

$conn = require("../Database/SelectDatabase.php");

$username = $_GET["Username"];
$fundsToAdd = $_GET["FundsToAdd"];

$query =
    "UPDATE user
    SET Balance = user.Balance + $fundsToAdd
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
//
// QUERY:
// UPDATE user 
// SET CPU = null 
// WHERE Username = "Admin"
//
// RESULTING JSON:
// {"UpdateSuccessful":true}