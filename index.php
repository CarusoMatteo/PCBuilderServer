<?php
print('
<a href="www.qr-code-generator.com/" border="0" style="cursor:default" rel="nofollow">
<img src="https://chart.googleapis.com/chart?cht=qr&chl=http%3A%2F%2F' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'] . '&chs=180x180&choe=UTF-8&chld=L|2">
</a>
');