<?php

$conn = require("../Database/SelectDatabase.php");

#region

$brandSamsung = "";
$brandGigabyte = "";
$brandCorsair = "";

if (isset($_GET["brandSamsung"]))
    $brandSamsung = "Brand = 'Samsung'";
if (isset($_GET["brandGigabyte"]))
    $brandGigabyte = "Brand = 'Gigabyte'";
if (isset($_GET["brandCorsair"]))
    $brandCorsair = "Brand = 'Corsair'";

$brandArray = array(
    $brandSamsung,
    $brandGigabyte,
    $brandCorsair
);

$typeNVME4 = "";
$typeNVME5 = "";
$typeSATA = "";

if (isset($_GET["typeNVME4"]))
    $typeNVME4 = "Type = 'NVMe M.2 4.0'";
if (isset($_GET["typeNVME5"]))
    $typeNVME5 = "Type = 'NVMe M.2 5.0'";
if (isset($_GET["typeSATA"]))
    $typeSATA = "Type = 'SATA'";

$typeArray = array(
    $typeNVME4,
    $typeNVME5,
    $typeSATA
);

$size250 = "";
$size500 = "";
$size1000 = "";
$size2000 = "";

if (isset($_GET["size250"]))
    $size250 = "Size = 250";
if (isset($_GET["size500"]))
    $size500 = "Size = 500";
if (isset($_GET["size1000"]))
    $size1000 = "Size = 1000";
if (isset($_GET["size2000"]))
    $size2000 = "Size = 2000";

$sizeArray = array(
    $size250,
    $size500,
    $size1000,
    $size2000
);

#endregion

$GLOBALS['firstFilterApplied'] = true;


$query = "SELECT *\nFROM storage";
$query .= checkArray($brandArray);
$query .= checkArray($typeArray);
$query .= checkArray($sizeArray);

/* The query is printed here (the \n new line is replaced with html's <br>)
print("<br>" . str_replace("\n", "<br>", $query) . "<br><br>");
*/

$cpus = mysqli_query($conn, $query);

$numrows = mysqli_num_rows($cpus);

$result = array();
$index = 1;

if ($numrows > 0) {
    while ($rows = mysqli_fetch_assoc($cpus)) {
        $result[$index] = array(
            'IdStorage' => $rows['IdStorage'],
            'Brand' => $rows['Brand'],
            'Name' => $rows['Name'],
            'Price' => $rows['Price'],
            'ImageURL' => $rows['ImageURL'],
            'Type' => $rows['Type'],
            'Size' => $rows['Size'],
        );
        $index++;
    }
    $result['Empty'] = false;
} else {
    $result['Empty'] = true;
}

$json = json_encode($result);
print($json);


function checkArray($array)
{
    $query = "";

    $firstActiveFilterPerName = true; // 'OR' must be added instead of 'AND'

    foreach ($array as $item) {
        if ($item != "")
            if ($GLOBALS['firstFilterApplied']) {
                $query .= "\nWHERE (" . $item;
                $GLOBALS['firstFilterApplied'] = false;
                $firstActiveFilterPerName = false;
            } else {
                if ($firstActiveFilterPerName) {
                    $query .= "\nAND (" . $item;
                    $firstActiveFilterPerName = false;
                } else {
                    $query .= "\nOR " . $item;
                }
            }
    }

    if ($query != "")
        $query .= ")";

    return $query;
}
