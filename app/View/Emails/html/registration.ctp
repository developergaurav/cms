<?php 
	$registrantDetails = json_decode($data['Client']['details'],true);
?>
Hello <?php echo $registrantDetails['first_name']." ".$registrantDetails['last_name'];?>, <br>

Thank you for completing registration.<br>
Your details are given bellow :<br>
<strong>First Name :</strong> <?php echo $registrantDetails['first_name'];?><br>
<strong>Last Name :</strong> <?php echo $registrantDetails['last_name'];?><br>
<strong>Address :</strong> <?php echo $registrantDetails['address_line_1']."<br>".$registrantDetails['address_line_2'];?><br><br>
<strong>Username :</strong> <?php echo $data['Client']['username'];?><br>
For security reason, we don't send you the Password.<br>

Thank you for stay with us.<br>

Sincerely,<br>
Timeoutstore.com
