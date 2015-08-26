<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Zones extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	
	function Zone_List(){

		$query= $this->db->get('confzone');
		
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
		else
		{
			return false;
		}
	}
	
	function getZone($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$action = $data['act'];
			$idZone = $data['id'];

			$data = array();

			//Datos del usuario
			$query= $this->db->get_where('confzone',array('zonaId'=>$idZone));
			if ($query->num_rows() != 0)
			{
				$u = $query->result_array();
				$data['zone'] = $u[0];
			} else {
				$zone = array();
				$zone['zonaName'] = '';
				$data['zone'] = $zone;
			}

			//Readonly
			$readonly = false;
			if($action == 'Del' || $action == 'View'){
				$readonly = true;
			}
			$data['read'] = $readonly;

			return $data;
		}
	}
	
	function setZone($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$id = $data['id'];
			$act = $data['act'];
			$zone = $data['zone'];

			$data = array(
					   'zonaName' => $zone
					);

			switch($act){
				case 'Add':
					//Agregar zona
					if($this->db->insert('confzone', $data) == false) {
						return false;
					}
					break;

				case 'Edit':
					//Actualizar nombre
					if($this->db->update('confzone', $data, array('zonaId'=>$id)) == false) {
						return false;
					}
					break;

				case 'Del':
					//Eliminar zona
					if($this->db->delete('confzone', $data, array('zonaId'=>$id)) == false) {
						return false;
					}
					
					break;
			}

			return true;

		}
	}
}
?>