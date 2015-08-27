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
				$c = $query->result_array();
				$c[0]['cliDateOfBirth'] = explode('-', $c[0]['cliDateOfBirth']);
				$c[0]['cliDateOfBirth'] = $c[0]['cliDateOfBirth'][2].'-'.$c[0]['cliDateOfBirth'][1].'-'.$c[0]['cliDateOfBirth'][0];
				$c[0]['cliImagePath'] = ( $c[0]['cliImagePath'] != '' ? 'assets/img/customers/'.$c[0]['cliImagePath'] : '');
				$data['customer'] = $c[0];
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
				$cust['cliImagePath'] = '';
				$cust['cliDay'] = '30';

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

			//Prefrencias
			$data['preferences'] = array();
			$query= $this->db->get('conffamily');
			if ($query->num_rows() != 0) {
					
					foreach ($query->result() as $f) {

						//-----------
						$this->db->select('confsubfamily.*, admcustomerpreferences.sfamId as acepted ');
						$this->db->from('confsubfamily');
						$this->db->join('admcustomerpreferences', ' admcustomerpreferences.sfamId = confsubfamily.sfamId And admcustomerpreferences.cliId = '.$idCust.'', 'left');
						$this->db->where(array('famId'=>$f->famId));
						//-----------

						$querySF = $this->db->get();
						if($querySF->num_rows() != 0) {
							$f->subf = $querySF->result_array();	
							$data['preferences'][] = $f;
						} else {
							//No agregar a la lista
						}
					}

			} else {
				//No hay subfamilias
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
			$img = $data['img'];
			$update = $data['update'];
			$preferences = $data['pref'];
			$day = $data['days'];


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
				   'zonaId' => $zona,
				   'cliImagePath' => ($update == 0 ? '' : $id.'.png'),
				   'cliDay' => $day
				);

			switch($act){
				case 'Add':
					//Agregar Usuario 
					if($this->db->insert('admcustomers', $data) == false) {
						return false;
					} else {
						$id = $this->db->insert_id();

						$img = str_replace('data:image/png;base64,', '', $img);
						$img = str_replace(' ', '+', $img);
						$data = base64_decode($img);
						file_put_contents('assets/img/customers/'.$id.'.png', $data);

						$data = array(
								'cliImagePath' => $id.'.png'
							);
						if($this->db->update('admcustomers', $data, array('cliId'=>$id)) == false) {
				 		return false;
				 		}

				 		//Agregar preferencias
				 		if(count($preferences) > 0) {
					 		foreach ($preferences as $p) {
					 			if($p != 0) {
									$data = array(
									   'sfamId' => $p,
									   'cliId' => $id
									);
									if($this->db->insert('admcustomerpreferences', $data) == false) {
										return false;
									}
								}
							}
						}

					}
					break;

				 case 'Edit':
				 	//Actualizar usuario
				 	if($this->db->update('admcustomers', $data, array('cliId'=>$id)) == false) {
				 		return false;
				 	}

				 	$img = str_replace('data:image/png;base64,', '', $img);
					$img = str_replace(' ', '+', $img);
					$data = base64_decode($img);
					file_put_contents('assets/img/customers/'.$id.'.png', $data);

					//Eliminar preferencias
					if($this->db->delete('admcustomerpreferences', array('cliId' => $id)) == false) {
						return false;
					}

					//Agregar preferencias
					if(count($preferences) > 0) {
				 		foreach ($preferences as $p) {
				 			if($p != 0) {
								$data = array(
								   'sfamId' => $p,
								   'cliId' => $id
								);
								if($this->db->insert('admcustomerpreferences', $data) == false) {
									return false;
								}
							}
						}
					}
				 	break;

				 case 'Del':
				 	//Eliminar preferencias
					if($this->db->delete('admcustomerpreferences', array('cliId' => $id)) == false) {
						return false;
					}

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