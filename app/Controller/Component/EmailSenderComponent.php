<?php
App::uses('CakeEmail', 'Network/Email');
class EmailSenderComponent extends Component {
	
	public function sendEmail($options = array()){
		if($_SERVER['SERVER_NAME'] !== 'localhost'){
			$uyEmailSender = new CakeEmail();
			$uyEmailSender->from(array($options['from_email'] => $options['from_name']))
			->to($options['to'])
			->subject($options['subject'])
			->template($options['template'])
			->emailFormat('html')
			->viewVars(array('data'=>$options['data']))
			->send();
		}
	}
	
}