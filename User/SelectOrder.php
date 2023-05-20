<?php

$conn = require("../Database/SelectDatabase.php");

$id = $_GET["Id"];

$query =
    "SELECT *
    FROM orderhistory
    WHERE orderhistory.User = '$id'
";

// print($query . "<br>");

$orders = mysqli_query($conn, $query);

$numrows = mysqli_num_rows($orders);

$result = array();
$index = 1;

if ($numrows > 0) {
    while ($rows = mysqli_fetch_assoc($orders)) {
        $result[$index] = array(
            'IdOrder' => $rows['IdOrder'],
            'Date' => $rows['Date'],
            'TotalCost' => $rows['TotalCost'],
            'User' => $rows['User'],
            'CPU' => $rows['CPU'],
            'Motherboard' => $rows['Motherboard'],
            'RAM' => $rows['RAM'],
            'GPU' => $rows['GPU'],
            'Storage' => $rows['Storage'],
            'PSU' => $rows['PSU']
        );
        $index++;
    }
    $result['Empty'] = false;
} else {
    $result['Empty'] = true;
}

$json = json_encode($result);
print($json);
