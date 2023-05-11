<?php

$conn = require("../Database/SelectDatabase.php");

#region

$brandCorsair = "";
$brandGSkill = "";
$brandKingston = "";

if (isset($_GET["brandCorsair"]))
    $brandCorsair = "Brand = 'Corsair'";
if (isset($_GET["brandGSkill"]))
    $brandGSkill = "Brand = 'G.Skill'";
if (isset($_GET["brandKingston"]))
    $brandKingston = "Brand = 'Kingston'";

$brandArray = array(
    $brandCorsair,
    $brandGSkill,
    $brandKingston
);

$memoryTypeDDR4 = "";
$memoryTypeDDR5 = "";

if (isset($_GET["memoryTypeDDR4"]))
    $memoryTypeDDR4 = "RAMType = 'DDR4'";
if (isset($_GET["memoryTypeDDR5"]))
    $memoryTypeDDR5 = "RAMType = 'DDR5'";

$memoryTypeArray = array(
    $memoryTypeDDR4,
    $memoryTypeDDR5
);

$totalSize8 = "";
$totalSize16 = "";
$totalSize32 = "";
$totalSize64 = "";

if (isset($_GET["totalSize8"]))
    $totalSize8 = "TotalSize = 8";
if (isset($_GET["totalSize16"]))
    $totalSize16 = "TotalSize = 16";
if (isset($_GET["totalSize32"]))
    $totalSize32 = "TotalSize = 32";
if (isset($_GET["totalSize64"]))
    $totalSize64 = "TotalSize = 64";

$totalSizeArray = array(
    $totalSize8,
    $totalSize16,
    $totalSize32,
    $totalSize64
);

$numberOfSticks1 = "";
$numberOfSticks2 = "";
$numberOfSticks4 = "";

if (isset($_GET["numberOfSticks1"]))
    $numberOfSticks1 = "NumberOfSticks = 1";
if (isset($_GET["numberOfSticks2"]))
    $numberOfSticks2 = "NumberOfSticks = 2";
if (isset($_GET["numberOfSticks4"]))
    $numberOfSticks4 = "NumberOfSticks = 4";

$numberOfSticksArray = array(
    $numberOfSticks1,
    $numberOfSticks2,
    $numberOfSticks4
);

$memorySpeed3200 = "";
$memorySpeed3600 = "";
$memorySpeed5600 = "";
$memorySpeed6000 = "";
$memorySpeed6600 = "";

if (isset($_GET["memorySpeed3200"]))
    $memorySpeed3200 = "Speed = 3200";
if (isset($_GET["memorySpeed3600"]))
    $memorySpeed3600 = "Speed = 3600";
if (isset($_GET["memorySpeed5600"]))
    $memorySpeed5600 = "Speed = 5600";
if (isset($_GET["memorySpeed6000"]))
    $memorySpeed6000 = "Speed = 6000";
if (isset($_GET["memorySpeed6600"]))
    $memorySpeed6600 = "Speed = 6600";

$memorySpeedArray = array(
    $memorySpeed3200,
    $memorySpeed3600,
    $memorySpeed5600,
    $memorySpeed6000,
    $memorySpeed6600
);

#endregion

$GLOBALS['firstFilterApplied'] = true;


$query = "SELECT *\nFROM ram";
$query .= checkArray($brandArray);
$query .= checkArray($memoryTypeArray);
$query .= checkArray($totalSizeArray);
$query .= checkArray($numberOfSticksArray);
$query .= checkArray($memorySpeedArray);

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
            'IdRAM' => $rows['IdRAM'],
            'Brand' => $rows['Brand'],
            'Name' => $rows['Name'],
            'Price' => $rows['Price'],
            'ImageURL' => $rows['ImageURL'],
            'RAMType' => $rows['RAMType'],
            'Speed' => $rows['Speed'],
            'TotalSize' => $rows['TotalSize'],
            'NumberOfSticks' => $rows['NumberOfSticks']
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