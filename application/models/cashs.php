<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Cashs extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	
	function Cashs_List(){

		$this->db->select('admcredits.*, admcustomers.cliName, admcustomers.cliLastName, sisusers.usrNick ');
		$this->db->from('admcredits');
		$this->db->join('admcustomers', 'admcustomers.cliId = admcredits.cliId');
		$this->db->join('sisusers', ' sisusers.usrId = admcredits.usrId');
		
		$query= $this->db->get();

		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
		else
		{	
			return false;
		}
	}
	
	function getMotion($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$action = $data['act'];
			$idCrd = $data['id'];

			$data = array();

			//Datos del movimiento
			$this->db->select('admcredits.*, sisusers.usrNick ');
			$this->db->from('admcredits');
			$this->db->join('sisusers', ' sisusers.usrId = admcredits.usrId');	
			$this->db->where('admcredits.crdId',$idCrd); // Set Filter		
			$query= $this->db->get();

			if ($query->num_rows() != 0)
			{
				$m = $query->result_array();
				$data['motion'] = $m[0];
			} else {
				$mov = array();
				$mov['crdId'] = '';
				$mov['crdDescription'] = '';
				$mov['crdDate'] = '';
				$mov['crdDebe'] = '';
				$mov['crdHaber'] = '';
				$mov['crdNote'] = '';
				$data['motion'] = $mov;
			}

			//Readonly
			$readonly = false;
			if($action == 'Del' || $action == 'View'){
				$readonly = true;
			}
			$data['read'] = $readonly;

			//Customers
			$query= $this->db->get('admcustomers');
			if ($query->num_rows() != 0)
			{
			 	$data['customers'] = $query->result_array();	
			}
			
			return $data;
		}
	}
	
	function setMotion($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$id = $data['id'];
            $act = $data['act'];
            $cliId = $data['cliId'];
            $desc = $data['desc'];
            $debe = $data['debe'];
            $haber = $data['haber'];
            $note = $data['note'];

            $userdata = $this->session->userdata('user_data');
			$usrId = $userdata[0]['usrId'];

			$data = array(
				   'crdDescription' => $desc,
				   'crdDate' => date('Y-m-d H:i:s'),
				   'crdDebe' => $debe,
				   'crdHaber' => $haber,
				   'crdNote' => $note,
				   'cliId' => $cliId,
				   'usrId' => $usrId				   
				);

			switch($act){
				case 'Add':
					//Agregar Movimiento 
					if($this->db->insert('admcredits', $data) == false) {
						return false;
					} 
					break;
				
				/*	
				case 'Del':
				 	//Eliminar Articulo
				 	if($this->db->delete('admproducts', array('prodId'=>$id)) == false) {
				 		return false;
				 	}
				 	break;
				*/	
			}
			return true;

		}
	}

	function getBalance(){
		$data = array();
		$this->db->select('admcustomers.cliId, admcustomers.cliName, admcustomers.cliLastName, IF((sum(admcredits.crdDebe) - sum(admcredits.crdHaber) ) IS NULL, 0 ,(sum(admcredits.crdDebe) - sum(admcredits.crdHaber) )) as balance ');
		$this->db->from('admcustomers');
		$this->db->join('admcredits', ' admcredits.cliId = admcustomers.cliId', 'left');	
		$this->db->group_by("admcustomers.cliId"); 
		$query= $this->db->get();

		if ($query->num_rows() != 0)
		{
		 	$data['customers'] = $query->result_array();	
		}
		
		return $data;
	}
	
}
?>