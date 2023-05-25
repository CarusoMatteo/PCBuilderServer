<?php

$conn = require("../Database/SelectDatabase.php");

$username = $_GET["Username"];
$totalPrice = $_GET["TotalPrice"];

$idCPU = "null";
$idMotherboard = "null";
$idRAM = "null";
$idGPU = "null";
$idStorage = "null";
$idPSU = "null";

if (isset($_GET["IdCPU"]))
    $idCPU = $_GET["IdCPU"];
if (isset($_GET["IdMotherboard"]))
    $idMotherboard = $_GET["IdMotherboard"];
if (isset($_GET["IdRAM"]))
    $idRAM = $_GET["IdRAM"];
if (isset($_GET["IdGPU"]))
    $idGPU = $_GET["IdGPU"];
if (isset($_GET["IdStorage"]))
    $idStorage = $_GET["IdStorage"];
if (isset($_GET["IdPSU"]))
    $idPSU = $_GET["IdPSU"];

$query = "SELECT Balance
    FROM user
    WHERE Username = '$username'"
;
$balance = mysqli_fetch_assoc(mysqli_query($conn, $query))["Balance"];

$query = "INSERT INTO orderhistory (User, TotalCost, CPU, Motherboard, RAM, GPU, Storage, PSU)
    VALUES ('$username', $totalPrice, $idCPU, $idMotherboard, $idRAM, $idGPU, $idStorage, $idPSU);\n\n";

//print(str_replace("\n", "<br>", $query) . "<br>");

try {
    mysqli_query($conn, $query);
} catch (Exception $e) {
    print($e);
    $result["CreateOrderSuccessful"] = false;
}
$result["CreateOrderSuccessful"] = true;

$query = "UPDATE user
    SET CPU = null,
    Motherboard = null,
    RAM = null,
    GPU = null,
    Storage = null,
    PSU = null,
    ";
if ($balance < $totalPrice)
    $query .= "Balance = 0
    ";
else {
    $newBalance = $balance - $totalPrice;
    $query .= "Balance = $newBalance
    ";
}
$query .= "WHERE Username = '$username';\n
";

// print(str_replace("\n", "<br>", $query) . "<br>");

try {
    mysqli_query($conn, $query);
} catch (Exception $e) {
    print($e);
    $result["UpdateUserSuccessful"] = false;
}

$result["UpdateUserSuccessful"] = true;


mysqli_close($conn);

$json = json_encode($result);
print($json);

// EXAMPLE:
// CreateOrder.php?Username=Admin&TotalPrice=35.3
//
// INSERT INTO orderhistory
// (Username, TotalCost, CPU, Motherboard, RAM, GPU, Storage, PSU,) 
// VALUES 
// ('Admin', 35.3, 6, 5, 4, 3, 2, 1) 
//
// 
// {"CreateOrderSuccessful":true}