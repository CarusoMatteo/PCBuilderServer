<?php
$fullURI = $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
$code = substr($fullURI, 0, 18);
print($code . "<br>");
print('
<img src="https://chart.googleapis.com/chart?cht=qr&chl=' . $code . '&chs=180x180&choe=UTF-8&chld=L|2" alt="qr code">
');