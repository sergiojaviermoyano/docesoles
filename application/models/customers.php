<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Customers extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	
	function Customers_List(){

		$query= $this->db->get('admcustomers');
		
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
		else
		{
			return false;
		}
	}
	
	function getCustomer($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$action = $data['act'];
			$idCust = $data['id'];

			$data = array();

			//Datos del usuario
			$query= $this->db->get_where('admcustomers',array('cliId'=>$idCust));
			if ($query->num_rows() != 0)
			{
				$u = $query->result_array();
				$data['customer'] = $u[0];
			} else {
				$cust = array();
				
				//select max id de cliente
				$this->db->select_max('cliId');
 				$query = $this->db->get('admcustomers');
 				$id = $query->result_array();
				$cust['cliNroCustomer'] = $id[0]['cliId'] + 1;

				$cust['cliId'] = '';
				$cust['cliName'] = '';
				$cust['cliLastName'] = '';
				$cust['cliDni'] = '';
				$cust['cliDateOfBirth'] = '';
				$cust['cliAddress'] = '';
				$cust['cliPhone'] = '';
				$cust['cliMovil'] = '';
				$cust['cliEmail'] = '';
				$cust['cliImagePath'] = '';
				$cust['zonaId'] = '';

				$data['customer'] = $cust;
			}

			//Readonly
			$readonly = false;
			if($action == 'Del' || $action == 'View'){
				$readonly = true;
			}
			$data['read'] = $readonly;

			//Zonas
			$query= $this->db->get('confzone');
			if ($query->num_rows() != 0)
			{
				$data['zone'] = $query->result_array();	
			}
			
			return $data;
		}
	}
	
	function setCustomer($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$id = $data['id'];
			$act = $data['act'];
			$nro = $data['nro'];
			$name = $data['name'];
			$lnam = $data['lnam'];
			$dni = $data['dni'];
			$mail = $data['mail'];
			$fech = explode('-', $data['fech']);
			$fech = $fech[2].'-'.$fech[1].'-'.$fech[0];
			$dom = $data['dom'];
			$tel = $data['tel'];
			$movil = $data['movil'];
			$zona = $data['zona'];

			$data = array(
				   'cliDni' => $dni,
				   'cliName' => $name,
				   'cliLastName' => $lnam,
				   'cliDateOfBirth' => $fech,
				   'cliNroCustomer' => $nro,
				   'cliAddress' => $dom,
				   'cliPhone' => $tel,
				   'cliMovil' => $movil,
				   'cliEmail' => $mail,
				   'cliImagePath' => '',
				   'zonaId' => $zona
				);

			switch($act){
				case 'Add':
					//Agregar Usuario 
					if($this->db->insert('admcustomers', $data) == false) {
						return false;
					}else{
						return true;
					}
					break;

				 case 'Edit':
				 	//Actualizar usuario
				 	if($this->db->update('admcustomers', $data, array('cliId'=>$id)) == false) {
				 		return false;
				 	}
				 	break;

				 case 'Del':
				 	//Eliminar usuario
				 	if($this->db->delete('admcustomers', array('cliId'=>$id)) == false) {
				 		return false;
				 	}
				 	break;
			}

			return true;

		}
	}
	
}
?>