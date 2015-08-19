<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class group extends CI_Controller {

	public function index()
	{
		$this->load->view('header');
		$this->load->view('login');
		$this->load->view('footer');
	}

	public function sessionStart(){
		echo json_encode(1);
	}
	
}
