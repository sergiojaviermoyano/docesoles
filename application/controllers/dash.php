<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class dash extends CI_Controller {

	public function index()
	{
		$this->load->view('header');
		$this->load->view('dash');
		$this->load->view('menu');
		$this->load->view('content');
		$this->load->view('footerdash');
		$this->load->view('footer');
	}
}
