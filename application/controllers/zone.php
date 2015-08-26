<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class zone extends CI_Controller {

	function __construct()
        {
		parent::__construct();
		$this->load->model('Zones');
	}

	public function index()
	{
		$data['list'] = $this->Zones->Zone_List();
		$this->load->view('zones/list', $data);
	}
	
	public function getZone(){
		$data['data'] = $this->Zones->getZone($this->input->post());
		$response['html'] = $this->load->view('zones/view_', $data, true);

		echo json_encode($response);
	}
	
	public function setZone(){
		$data = $this->Zones->setZone($this->input->post());
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
