<?php

$conn = require("../Database/SelectDatabase.php");

#region

$brandMSI = "";
$brandAsus = "";
$brandGigabyte = "";

if (isset($_GET["brandMSI"]))
    $brandMSI = "Brand = 'MSI'";
if (isset($_GET["brandAsus"]))
    $brandAsus = "Brand = 'Asus'";
if (isset($_GET["brandGigabyte"]))
    $brandGigabyte = "Brand = 'Gigabyte'";

$brandArray = array(
    $brandMSI,
    $brandAsus,
    $brandGigabyte
);

$chipsetBrandNVIDIA = "";
$chipsetBrandAMD = "";

if (isset($_GET["chipsetBrandNVIDIA"]))
    $chipsetBrandNVIDIA = "ChipsetBrand = 'NVIDIA GeForce'";
if (isset($_GET["chipsetBrandAMD"]))
    $chipsetBrandAMD = "ChipsetBrand = 'AMD Radeon'";

$chipsetBrandArray = array(
    $chipsetBrandNVIDIA,
    $chipsetBrandAMD
);

$chipsetRTX3050 = "";
$chipsetRTX3060 = "";
$chipsetRTX3080 = "";
$chipsetRTX3090 = "";
$chipsetRTX4080 = "";
$chipsetRTX4090 = "";
$chipsetRX6500XT = "";
$chipsetRX6600XT = "";
$chipsetRX6800XT = "";
$chipsetRX6900XT = "";
$chipsetRX7900XT = "";
$chipsetRX7900XTX = "";

if (isset($_GET["chipsetRTX3050"]))
    $chipsetRTX3050 = "Chipset = 'RTX 3050'";
if (isset($_GET["chipsetRTX3060"]))
    $chipsetRTX3060 = "Chipset = 'RTX 3060'";
if (isset($_GET["chipsetRTX3080"]))
    $chipsetRTX3080 = "Chipset = 'RTX 3080'";
if (isset($_GET["chipsetRTX3090"]))
    $chipsetRTX3090 = "Chipset = 'RTX 3090'";
    if (isset($_GET["chipsetRTX4080"]))
    $chipsetRTX4080 = "Chipset = 'RTX 4080'";
if (isset($_GET["chipsetRTX4090"]))
    $chipsetRTX4090 = "Chipset = 'RTX 4090'";
if (isset($_GET["chipsetRX6500XT"]))
    $chipsetRX6500XT = "Chipset = 'RX 6500 XT'";
if (isset($_GET["chipsetRX6600XT"]))
    $chipsetRX6600XT = "Chipset = 'RX 6600 XT'";
if (isset($_GET["chipsetRX6800XT"]))
    $chipsetRX6800XT = "Chipset = 'RX 6800 XT'";
if (isset($_GET["chipsetRX6900XT"]))
    $chipsetRX6900XT = "Chipset = 'RX 6900 XT'";
    if (isset($_GET["chipsetRX7900XT"]))
    $chipsetRX7900XT = "Chipset = 'RX 7900 XT'";
if (isset($_GET["chipsetRX7900XTX"]))
    $chipsetRX7900XTX = "Chipset = 'RX 7900 XTX'";

$chipsetArray = array(
    $chipsetRTX3050,
    $chipsetRTX3060,
    $chipsetRTX3080,
    $chipsetRTX3090,
    $chipsetRTX4080,
    $chipsetRTX4090,
    $chipsetRX6500XT,
    $chipsetRX6600XT,
    $chipsetRX6800XT,
    $chipsetRX6900XT,
    $chipsetRX7900XT,
    $chipsetRX7900XTX
);

$VRAMSize4 = "";
$VRAMSize8 = "";
$VRAMSize10 = "";
$VRAMSize16 = "";
$VRAMSize20 = "";
$VRAMSize24 = "";


if (isset($_GET["VRAMSize4"]))
    $VRAMSize4 = "VRAMSize = 4";
if (isset($_GET["VRAMSize8"]))
    $VRAMSize8 = "ChipsetBrand = 8";
if (isset($_GET["VRAMSize4"]))
    $VRAMSize10 = "ChipsetBrand = 10";
if (isset($_GET["VRAMSize16"]))
    $VRAMSize16 = "VRAMSize = 16";
if (isset($_GET["VRAMSize20"]))
    $VRAMSize20 = "ChipsetBrand = 20";
if (isset($_GET["VRAMSize24"]))
    $VRAMSize24 = "ChipsetBrand = 24";

$VRAMSizeArray = array(
    $VRAMSize4,
    $VRAMSize8,
    $VRAMSize10,
    $VRAMSize16,
    $VRAMSize20,
    $VRAMSize24
);

$numberoOfHDMI1 = "";
$numberoOfHDMI2 = "";
$numberoOfHDMI3 = "";

if (isset($_GET["numberoOfHDMI1"]))
    $numberoOfHDMI1 = "NumberOfHDMI = 1";
if (isset($_GET["numberoOfHDMI2"]))
    $numberoOfHDMI2 = "NumberOfHDMI = 2";
if (isset($_GET["numberoOfHDMI3"]))
    $numberoOfHDMI3 = "NumberOfHDMI = 3";

$numberoOfHDMIArray = array(
    $numberoOfHDMI1,
    $numberoOfHDMI2,
    $numberoOfHDMI3
);

$numberoOfDP1 = "";
$numberoOfDP2 = "";
$numberoOfDP3 = "";

if (isset($_GET["numberoOfDP1"]))
    $numberoOfDP1 = "NumberOfDisplayPort = 1";
if (isset($_GET["numberoOfDP2"]))
    $numberoOfDP2 = "NumberOfDisplayPort = 2";
if (isset($_GET["numberoOfDP3"]))
    $numberoOfDP3 = "NumberOfDisplayPort = 3";

$numberoOfDPArray = array(
    $numberoOfDP1,
    $numberoOfDP2,
    $numberoOfDP3
);

#endregion

$GLOBALS['firstFilterApplied'] = true;


$query = "SELECT *\nFROM gpu";
$query .= checkArray($brandArray);
$query .= checkArray($chipsetBrandArray);
$query .= checkArray($chipsetArray);
$query .= checkArray($VRAMSizeArray);
$query .= checkArray($numberoOfHDMIArray);
$query .= checkArray($numberoOfDPArray);

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
            'IdGPU' => $rows['IdGPU'],
            'Brand' => $rows['Brand'],
            'Name' => $rows['Name'],
            'Price' => $rows['Price'],
            'ImageURL' => $rows['ImageURL'],
            'ChipsetBrand' => $rows['ChipsetBrand'],
            'Chipset' => $rows['Chipset'],
            'VRAMSize' => $rows['VRAMSize'],
            'ClockSpeed' => $rows['ClockSpeed'],
            'Length' => $rows['Length'],
            'Size' => $rows['Size'],
            'TDP' => $rows['TDP'],
            'NumberOfHDMI' => $rows['NumberOfHDMI'],
            'NumberOfDisplayPort' => $rows['NumberOfDisplayPort']
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
