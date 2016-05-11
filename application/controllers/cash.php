<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class cash extends CI_Controller {

	function __construct()
        {
		parent::__construct();
		$this->load->model('Cashs');
	}

	public function index($permission)
	{
		$data['list'] = $this->Cashs->Cashs_List($this->input->post());
		$data['permission'] = $permission;
		$this->load->view('cash/list', $data);
	}

	public function pagination()
	{
		echo json_encode($this->Cashs->Cashs_List($this->input->post()));
	}

	public function getMotioPagination(){
		$filter = array(
				'start'		=> $_REQUEST['start'],
				'length'	=> $_REQUEST['length'],
				'order'		=> $_REQUEST['order'][0],
				'search'	=> $_REQUEST['search'],
			);

		//var_dump($filter);
		echo json_encode($this->Cashs->Cashs_List_Pagination($filter)); 
	}
	
	public function getMotion(){
		$data['data'] = $this->Cashs->getMotion($this->input->post());
		$response['html'] = $this->load->view('cash/view_', $data, true);

		echo json_encode($response);
	}
	
	public function setMotion(){
		$data = $this->Cashs->setMotion($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode(true);	
		}
	}

	public function getBalance(){
		$data['data'] = $this->Cashs->getBalance();
		$response['html'] = $this->load->view('cash/balance_', $data, true);

		echo json_encode($response);
	}

	public function setPay(){
		$data = $this->Cashs->setPay($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode($data);	
		}
	}
}