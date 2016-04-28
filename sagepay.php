<?php


	echo "Inside Command <br/>";

	$command 	= 'version';
	$vendor 	= 'Purepackage';
	$user 		= 'Kandysolutions';
	$password 	= 'Pure49stars?';
	// $startdate = '01/05/2013 00:00:01';
	// $enddate = '31/05/2013 23:59:59';

	$string = '<command>'.$command.'</command>
				<vendor>'.$vendor.'</vendor>
				<user>'.$user.'</user>';

	$crypt = MD5($string . '<password>' . $password . '</password>');

	//$curl = curl_init('https://test.sagepay.com/access/access.htm'); 
	$curl = curl_init('https://live.sagepay.com/access/access.htm'); 
	curl_setopt($curl, CURLOPT_FAILONERROR, true); 
	curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true); 
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true); 
	curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false); 
	curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);   
	$result = curl_exec($curl); 

	$rxml = simplexml_load_string($result);
	print_r($rxml);


//echo $rxml->transactions->transaction[0]->amount;

?>

<HTML>

<BODY>


<form method="post" action="https://live.sagepay.com/access/access.htm">
<input type="hidden" name="act" value=1>
<input type="hidden" name="XML" value="<vspaccess><?php echo $string; ?> <signature><?php echo $crypt; ?></signature></vspaccess>">
<input type="submit" name="Button" value="Send">
</form>
</BODY>
</HTML>