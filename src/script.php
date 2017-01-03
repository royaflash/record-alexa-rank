<?php

function alexaParser($url) {

	$dir = 'DIR';
        ob_start();

        // Alexa Parameters
        $xml = simplexml_load_file('http://data.alexa.com/data?cli=10&dat=snbamz&url=' . $url);
        $rank = isset($xml -> SD[1] -> POPULARITY) ? $xml -> SD[1] -> POPULARITY -> attributes() -> TEXT : 0;
        $web = (string)$xml -> SD[0] -> attributes() -> HOST;
        $date = trim(preg_replace('/\n/', '', `date +%y%m%d`));

        // HTML Tags
        $newline = '<tr><td>';
        $seperator = '</td><td>';
        $closeline = '</td></tr>' . "\n";

        // Print Line
        echo $newline . $url . $seperator . $rank . $seperator . $date . $closeline;

        // Write HTML File
        $page = ob_get_contents();
        ob_end_clean();
        $file = $dir . $url . ".log";
        @chmod($file, 0755);
        $fw = fopen($file, "a");
        fputs($fw, $page, strlen($page));
        fclose($fw);

}

// call this method for each of your domains
alexaParser("DOMAIN");

die();
?>
