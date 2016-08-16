<table border="3" style="width: 100%;">
<tbody>
<tr>
<td align="center" width="20%">
<p style="text-align: center;"><strong>Domain</strong></p>
</td>
<td align="center">
<p style="text-align: center;"><strong>PageRank</strong></p>
</td>
<td align="center" width="40%">
<p style="text-align: center;"><strong>Date</strong></p>
</td>
</tr>
<?php
$name = "DOMAIN";
$dir = 'DIR';
$log = $dir . $name . ".log";
$f = fopen($log, "r");
echo fread($f,filesize($log)); 
fclose($f);
?>
</tbody>
</table>

