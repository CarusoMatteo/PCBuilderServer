<?php
#region

$conn = require("SelectDatabase.php");

$brandAsus = "";
$brandMSI = "";

if (isset($_GET["brandAsus"]))
    $brandAsus = "Brand = 'Asus'";
if (isset($_GET["brandMSI"]))
    $brandMSI = "Brand = 'MSI'";

$brandArray = array(
    $brandAsus,
    $brandMSI
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

$chipsetB550 = "";
$chipsetB650 = "";
$chipsetX570 = "";
$chipsetX670 = "";
$chipsetX670E = "";
$chipsetZ690 = "";
$chipsetZ790 = "";

if (isset($_GET["chipsetB550"]))
    $chipsetB550 = "Chipset = 'B550'";
if (isset($_GET["chipsetB650"]))
    $chipsetB650 = "Chipset = 'B650'";
if (isset($_GET["chipsetX570"]))
    $chipsetX570 = "Chipset = 'X570'";
if (isset($_GET["chipsetX670"]))
    $chipsetX670 = "Chipset = 'X670'";
if (isset($_GET["chipsetX670E"]))
    $chipsetX670E = "Chipset = 'X670E'";
if (isset($_GET["chipsetZ690"]))
    $chipsetZ690 = "Chipset = 'Z690'";
if (isset($_GET["chipsetZ790"]))
    $chipsetZ790 = "Chipset = 'Z790'";

$chipsetArray = array(
    $chipsetB550,
    $chipsetB650,
    $chipsetX570,
    $chipsetX670,
    $chipsetX670E,
    $chipsetZ690,
    $chipsetZ790
);

$formFactorATX = "";
$formFactorMicroATX = "";
$formFactorMiniITX = "";

if (isset($_GET["formFactorATX"]))
    $formFactorATX = "FormFactor = 'ATX'";
if (isset($_GET["formFactorMicroATX"]))
    $formFactorMicroATX = "FormFactor = 'Micro ATX'";
if (isset($_GET["formFactorMiniITX"]))
    $formFactorMiniITX = "FormFactor = 'Mini ITX'";

$formFactorArray = array(
    $formFactorATX,
    $formFactorMicroATX,
    $formFactorMiniITX,
);

$memoryTypeDDR4 = "";
$memoryTypeDDR5 = "";

if (isset($_GET["memoryTypeDDR4"]))
    $memoryTypeDDR4 = "RAMType = 'DDR4'";
if (isset($_GET["memoryTypeDDR5"]))
    $memoryTypeDDR5 = "RAMType = 'DDR5'";

$memoryTypeArray = array(
    $memoryTypeDDR4,
    $memoryTypeDDR5,
);

$memorySlotNumber2 = "";
$memorySlotNumber4 = "";

if (isset($_GET["memorySlotNumber2"]))
    $memorySlotNumber2 = "NumberOfRAMSlots = 2";
if (isset($_GET["memorySlotNumber4"]))
    $memorySlotNumber4 = "NumberOfRAMSlots = 4";

$memorySlotNumberArray = array(
    $memorySlotNumber2,
    $memorySlotNumber4,
);

$maxEthernetSpeed1 = "";
$maxEthernetSpeed25 = "";

if (isset($_GET["maxEthernetSpeed1"]))
    $maxEthernetSpeed1 = "MaxEthernetSpeed = 1";
if (isset($_GET["maxEthernetSpeed25"]))
    $maxEthernetSpeed25 = "MaxEthernetSpeed = 2.5";
// maxEthernetSpeed25=1
$maxEthernetSpeedArray = array(
    $maxEthernetSpeed1,
    $maxEthernetSpeed25,
);

$wifiIncludedYes = "";
$wifiIncludedNo = "";

if (isset($_GET["wifiIncludedYes"]))
    $wifiIncludedYes = "WifiIncluded = 1";
if (isset($_GET["wifiIncludedNo"]))
    $wifiIncludedNo = "WifiIncluded = 0";

$wifiIncludedArray = array(
    $wifiIncludedYes,
    $wifiIncludedNo,
);

$bluetoothIncludedYes = "";
$bluetoothIncludedNo = "";

if (isset($_GET["bluetoothIncludedYes"]))
    $bluetoothIncludedYes = "BluetoothIncluded = 1";
if (isset($_GET["bluetoothIncludedNo"]))
    $bluetoothIncludedNo = "BluetoothIncluded = 0";

$bluetoothIncludedArray = array(
    $bluetoothIncludedYes,
    $bluetoothIncludedNo,
);

$anyPCIe_5_x16Yes = "";
$anyPCIe_5_x16No = "";

if (isset($_GET["anyPCIe_5_x16Yes"]))
    $anyPCIe_5_x16Yes = "PCIe_x16_5 > 0";
if (isset($_GET["anyPCIe_5_x16No"]))
    $anyPCIe_5_x16No = "PCIe_x16_5 = 0";

$anyPCIe_5_x16Array = array(
    $anyPCIe_5_x16Yes,
    $anyPCIe_5_x16No,
);

$anyM2_NVMe_5Yes = "";
$anyM2_NVMe_5No = "";

if (isset($_GET["anyM2_NVMe_5Yes"]))
    $anyM2_NVMe_5Yes = "M2_5 > 0";
if (isset($_GET["anyM2_NVMe_5No"]))
    $anyM2_NVMe_5No = "M2_5 = 0";

$anyM2_NVMe_5Array = array(
    $anyM2_NVMe_5Yes,
    $anyM2_NVMe_5No,
);


#endregion

/* Every array is printed here
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


$query = "SELECT *\nFROM motherboard";
$query .= checkArray($brandArray);
$query .= checkArray($socketArray);
$query .= checkArray($chipsetArray);
$query .= checkArray($formFactorArray);
$query .= checkArray($memoryTypeArray);
$query .= checkArray($memorySlotNumberArray);
$query .= checkArray($maxEthernetSpeedArray);
$query .= checkArray($wifiIncludedArray);
$query .= checkArray($bluetoothIncludedArray);
$query .= checkArray($anyPCIe_5_x16Array);
$query .= checkArray($anyM2_NVMe_5Array);

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
            'IdMotherboard' => $rows['IdMotherboard'],
            'Brand' => $rows['Brand'],
            'Name' => $rows['Name'],
            'Price' => $rows['Price'],
            'ImageURL' => $rows['ImageURL'],
            'Socket' => $rows['Socket'],
            'Chipset' => $rows['Chipset'],
            'FormFactor' => $rows['FormFactor'],
            'RAMType' => $rows['RAMType'],
            'NumberOfRAMSlots' => $rows['NumberOfRAMSlots'],
            'MaxEthernetSpeed' => $rows['MaxEthernetSpeed'],
            'WifiIncluded' => $rows['WifiIncluded'],
            'BluetoothIncluded' => $rows['BluetoothIncluded'],

            'PCIe_x16_5' => $rows['PCIe_x16_5'],
            'PCIe_x16_4' => $rows['PCIe_x16_4'],
            'PCIe_x8' => $rows['PCIe_x8'],
            'PCIe_x4' => $rows['PCIe_x4'],
            'PCIe_x1' => $rows['PCIe_x1'],
            'M2_5' => $rows['M2_5'],
            'M2_4' => $rows['M2_4'],
            'NumberOfSATA' => $rows['NumberOfSATA'],
            'USB_2' => $rows['USB_2'],
            'USB_32_1' => $rows['USB_32_1'],
            'USB_32_2' => $rows['USB_32_2']
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