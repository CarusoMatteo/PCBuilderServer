<?php

$conn = require("../Database/SelectDatabase.php");

#region

$brandCorsair = "";
$brandSeaSonic = "";

if (isset($_GET["brandCorsair"]))
    $brandCorsair = "Brand = 'Corsair'";
if (isset($_GET["brandSeaSonic"]))
    $brandSeaSonic = "Brand = 'SeaSonic'";

$brandArray = array(
    $brandCorsair,
    $brandSeaSonic
);

$wattage550 = "";
$wattage650 = "";
$wattage750 = "";
$wattage850 = "";
$wattage1000 = "";

if (isset($_GET["wattage550"]))
    $wattage550 = "Wattage = 550";
if (isset($_GET["wattage650"]))
    $wattage650 = "Wattage = 650";
if (isset($_GET["wattage750"]))
    $wattage750 = "Wattage = 750";
if (isset($_GET["wattage850"]))
    $wattage850 = "Wattage = 850";
if (isset($_GET["wattage1000"]))
    $wattage1000 = "Wattage = 1000";

$wattageArray = array(
    $wattage550,
    $wattage650,
    $wattage750,
    $wattage850,
    $wattage1000
);

$formFactorATX = "";
$formFactorSFF = "";

if (isset($_GET["formFactorATX"]))
    $formFactorATX = "FormFactor = ATX";
if (isset($_GET["formFactorSFF"]))
    $formFactorSFF = "FormFactor = SFF";

$formFactorArray = array(
    $formFactorATX,
    $formFactorSFF,
);

$length160 = "";
$length170 = "";
$length180 = "";

if (isset($_GET["length160"]))
    $length160 = "Length = 160";
if (isset($_GET["length170"]))
    $length170 = "Length = 170";
if (isset($_GET["length180"]))
    $length180 = "Length = 180";

$lengthArray = array(
    $length160,
    $length170,
    $length180,
);
#endregion

$GLOBALS['firstFilterApplied'] = true;


$query = "SELECT *\nFROM psu";
$query .= checkArray($brandArray);
$query .= checkArray($wattageArray);
$query .= checkArray($formFactorArray);
$query .= checkArray($lengthArray);

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
            'IdPSU' => $rows['IdPSU'],
            'Brand' => $rows['Brand'],
            'Name' => $rows['Name'],
            'Price' => $rows['Price'],
            'ImageURL' => $rows['ImageURL'],
            'Wattage' => $rows['Wattage'],
            'FormFactor' => $rows['FormFactor'],
            'Length' => $rows['Length'],
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
