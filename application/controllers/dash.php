<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class dash extends CI_Controller {
	function __construct()
        {
		parent::__construct();
		$this->load->model('Groups');
		$this->load->model('Customers');
		$this->load->model('Calendar');
	}

	public function index()
	{
		$this->load->view('header');
		$userdata = $this->session->userdata('user_data');
		$data['userName'] = $userdata[0]['usrNick'];
		$this->load->view('dash', $data);
		$menu['menu'] = $this->Groups->buildMenu();
		$this->load->view('menu',$menu);
		$this->load->view('content');
		$this->load->view('footerdash');
		$this->load->view('footer');
	}

	public function calendar()
	{
		//$data['visits'] = $this->Customers->visits();
		$this->load->view('calendar/calendar');
	}

	public function getCustommers()
	{
		$data['customers'] = $this->Customers->Customers_List();
		$response['html'] = $this->load->view('calendar/programer_', $data, true);	

		echo json_encode($response);
	}

	public function getCustommerReprogram()
	{
		$data['customer'] = $this->Customers->status($this->input->post());
		$response['html'] = $this->load->view('calendar/reprogramer_', $data, true);	

		echo json_encode($response);
	}

	public function setVisit(){
		$data = $this->Calendar->setVisit($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode($data);	
		}
	}

	public function setReprogramVisit(){
		$data = $this->Calendar->setReprogramVisit($this->input->post());
		if($data  == false)
		{
			echo json_encode(false);
		}
		else
		{
			echo json_encode($data);	
		}
	}

	public function cancelVisit(){
		$data = $this->Calendar->cancelVisit($this->input->post());
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
