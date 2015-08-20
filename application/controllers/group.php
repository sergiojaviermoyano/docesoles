<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class group extends CI_Controller {

	function __construct()
        {
		parent::__construct();
		$this->load->model('Groups');
	}

	public function index()
	{
		$data['list'] = $this->Groups->Group_List();
		$this->load->view('groups/list', $data);
	}

	public function getMenu(){
		$data['list'] = $this->Groups->getMenu($this->input->post());
		$response['html'] = $this->load->view('groups/permission', $data, true);

		echo json_encode($response);
	}

	public function setMenu(){
		$data = $this->Groups->setMenu($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode(true);	
		}
	}
	
}
