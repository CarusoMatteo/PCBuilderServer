<?php

$conn = require("SelectDatabase.php");

$brandAMD = "";
$brandIntel = "";


if (isset($_GET["brandAMD"]))
    $brandAMD = "Brand = 'AMD'";
if (isset($_GET["brandIntel"]))
    $brandIntel = "Brand = 'Intel'";

$brandArray = array(
    $brandAMD,
    $brandIntel
);

$seriesRyzen5 = "";
$seriesRyzen7 = "";
$seriesRyzen9 = "";
$seriesCorei3 = "";
$seriesCorei5 = "";
$seriesCorei7 = "";
$seriesCorei9 = "";

if (isset($_GET["seriesRyzen5"]))
    $seriesRyzen5 = "Series = 'Ryzen 5'";
if (isset($_GET["seriesRyzen7"]))
    $seriesRyzen7 = "Series = 'Ryzen 7'";
if (isset($_GET["seriesRyzen9"]))
    $seriesRyzen9 = "Series = 'Ryzen 9'";
if (isset($_GET["seriesCorei3"]))
    $seriesCorei3 = "Series = 'Core i3'";
if (isset($_GET["seriesCorei5"]))
    $seriesCorei5 = "Series = 'Core i5'";
if (isset($_GET["seriesCorei7"]))
    $seriesCorei7 = "Series = 'Core i7'";
if (isset($_GET["seriesCorei9"]))
    $seriesCorei9 = "Series = 'Core i9'";

$seriesArray = array(
    $seriesRyzen5,
    $seriesRyzen7,
    $seriesRyzen9,
    $seriesCorei3,
    $seriesCorei5,
    $seriesCorei7,
    $seriesCorei9
);

$architectureZen3 = "";
$architectureZen4 = "";
$architectureAlderLake = "";
$architectureRaptorLake = "";

if (isset($_GET["architectureZen3"]))
    $architectureZen3 = "Architecture = 'Zen 3'";
if (isset($_GET["architectureZen4"]))
    $architectureZen4 = "Architecture = 'Zen 4'";
if (isset($_GET["architectureAlderLake"]))
    $architectureAlderLake = "Architecture = 'Alder Lake'";
if (isset($_GET["architectureRaptorLake"]))
    $architectureRaptorLake = "Architecture = 'Raptor Lake'";

$architectureArray = array(
    $architectureZen3,
    $architectureZen4,
    $architectureAlderLake,
    $architectureRaptorLake
);

$socketAM4 = "";
$socketAM5 = "";
$socketLGA1700 = "";

if (isset($_GET["socketAM4"]))
    $socketAM4 = "Socket = 'AM4'";
if (isset($_GET["socketAM5"]))
    $socketAM5 = "Socket = 'AM5'";
if (isset($_GET["socketLGA1700"]))
    $socketLGA1700 = "Socket = 'LGA1700'";

$socketArray = array(
    $socketAM4,
    $socketAM5,
    $socketLGA1700
);

$integratedGraphicsYes = "";
$integratedGraphicsNo = "";


if (isset($_GET["integratedGraphicsYes"]))
    $integratedGraphicsYes = "IntegratedGraphics = 1";
if (isset($_GET["integratedGraphicsNo"]))
    $integratedGraphicsNo = "IntegratedGraphics = 0";

$integratedGraphicsArray = array(
    $integratedGraphicsYes,
    $integratedGraphicsNo
);

/*
print("Brand: ");
print_r($brandArray);
print("<br>Series: ");
print_r($seriesArray);
print("<br>Architecture: ");
print_r($architectureArray);
print("<br>Socket: ");
print_r($socketArray);
print("<br>IntegratedGraphics: ");
print_r($integratedGraphicsArray);
*/

$GLOBALS['firstFilterApplied'] = true;


$query = "SELECT *\nFROM cpu";
$query .= checkArray($brandArray);
$query .= checkArray($seriesArray);
$query .= checkArray($architectureArray);
$query .= checkArray($socketArray);
$query .= checkArray($integratedGraphicsArray);

//print("<br>" . str_replace("\n", "<br>", $query) . "<br><br>");

$cpus = mysqli_query($conn, $query);

$numrows = mysqli_num_rows($cpus);

$result = array();
$index = 1;

if ($numrows > 0) {
    while ($rows = mysqli_fetch_assoc($cpus)) {
        $result[$index] = array(
            'IdCPU' => $rows['IdCPU'],
            'Brand' => $rows['Brand'],
            'Series' => $rows['Series'],
            'Name' => $rows['Name'],
            'Price' => $rows['Price'],
            'ImageURL' => $rows['ImageURL'],
            'NumberOfCores' => $rows['NumberOfCores'],
            'ClockSpeed' => $rows['ClockSpeed'],
            'TDP' => $rows['TDP'],
            'Architecture' => $rows['Architecture'],
            'Socket' => $rows['Socket'],
            'IntegratedGraphics' => $rows['IntegratedGraphics'],
            'CoolerIncluded' => $rows['CoolerIncluded']
        );
        $index++;
    }
    $result['Empty'] = false;
} else {
    $result['Empty'] = true;
}

/*
$all = mysqli_fetch_all(mysqli_query($conn, $query));
//print_r($all);
*/
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