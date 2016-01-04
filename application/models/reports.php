<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Reports extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	
	function getIn($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$from 	= $data['from'];
			$to 	= $data['to'];			

			$from 	= explode('-', $from);
			$from 	= $from[2].'-'.$from[1].'-'.$from[0];

			$to 	= explode('-', $to);
			$to 	= $to[2].'-'.$to[1].'-'.$to[0];
			$to 	= date('Y-m-d', strtotime($to.'+1 day'));

			$this->db->select_sum('crdHaber');
			$this->db->where('crdDate >=', $from);
			$this->db->where('crdDate <=', $to); 
			$query = $this->db->get('admcredits');

			$total = 0;
			if ($query->num_rows() != 0)
			{
				$c = $query->result_array();
				$total = $c[0];
			} 

			return $total;
		}
	}

	function getVt($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$from 	= $data['from'];
			$to 	= $data['to'];			

			$from 	= explode('-', $from);
			$from 	= $from[2].'-'.$from[1].'-'.$from[0];

			$to 	= explode('-', $to);
			$to 	= $to[2].'-'.$to[1].'-'.$to[0];
			$to 	= date('Y-m-d', strtotime($to.'+1 day'));

			$this->db->select_sum('crdDebe');
			$this->db->where('crdDate >=', $from);
			$this->db->where('crdDate <=', $to); 
			$query = $this->db->get('admcredits');

			$total = 0;
			if ($query->num_rows() != 0)
			{
				$c = $query->result_array();
				$total = $c[0];
			} 

			return $total;
		}
	}

}
?>