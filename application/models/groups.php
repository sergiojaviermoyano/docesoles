<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Groups extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	
	function Group_List(){

		$query= $this->db->get('sisgroups');
		//var_dump($query);
		
		if ($query->num_rows()!=0)
		{
			return $query->result_array();	
		}
		else
		{
			return false;
		}
	}

	function getMenu($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$menu = array();
			$query= $this->db->get_where('sismenu',array('menuFather'=>null));
			if ($query->num_rows() != 0)
			{
				foreach($query->result() as $items)
				{
					//ver si tiene hijos
					$querySon= $this->db->get_where('sismenu',array('menuFather'=>$items->menuId));
					if($querySon->num_rows() != 0)
					{
						//Añadir los hijos
						$items->childrens = $querySon->result();
						foreach ($items->childrens as $son) {
							$this->db->select('*');
							$this->db->from('sismenuactions');
							$this->db->join('sisactions', 'sisactions.actId = sismenuactions.actId');
							$this->db->where(array('menuId'=>$son->menuId));

							$queryActions= $this->db->get();
							$son->actions = $queryActions->result_array();	
							$son->childrens = array();
						}
						$items->actions = array();
						$menu[] = $items;
					}
					else
					{
						//Buscar las acciones
						$items->childrens = array();
						$this->db->select('*');
						$this->db->from('sismenuactions');
						$this->db->join('sisactions', 'sisactions.actId = sismenuactions.actId');
						$this->db->where(array('menuId'=>$items->menuId));

						$queryActions= $this->db->get();
						$items->actions = $queryActions->result_array();
						$menu[] = $items;
					}

				}

				return $menu;	
			}
			return $data;
		}
	}

	function setMenu($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$id = $data['id'];
			$act = $data['act'];
			$name = $data['name'];
			$options = $data['options'];

			$data = array(
					   'grpName' => $name
					);

			$id = 0;
			if($this->db->insert('sisgroups', $data) == false) {
				return false;
			}else{
				$id = $this->db->insert_id();
			}

			switch($act){
				case 'Add':
					//Agregar a sisgroupsactions
					foreach ($options as $o) {
						$data = array(
						   'grpId' => $id,
						   'menuAccId' => $o
						);
						if($this->db->insert('sisgroupsactions', $data) == false) {
							return false;
						}
					}
					break;
			}

			return true;

		}
	}
}
?>