<?php

$conn = require("SelectDatabase.php");

$username = $_GET["Username"];

$query =
    "SELECT *
    FROM 	((((((user
                 LEFT JOIN cpu
                        ON user.cpu = cpu.idcpu
                )
                LEFT JOIN motherboard
                       ON user.motherboard = motherboard.idmotherboard
               )
               LEFT JOIN ram
                      ON user.ram = ram.idram
              )
              LEFT JOIN gpu
                     ON user.gpu = gpu.idgpu
             )
             LEFT JOIN storage
                    ON user.storage = storage.idstorage
            )
            LEFT JOIN psu
                   ON user.psu = psu.idpsu
           )
    WHERE  user.username = '$username'
";

// print($query . "<br>");

try {
    $result = mysqli_fetch_assoc(mysqli_query($conn, $query));
} catch (Exception $e) {
    print($e);
    $result = array("Success" => false);
}

mysqli_close($conn);

if ($result == null) {
    $result = array("Success" => false);
}

$json = json_encode($result);
print($json);