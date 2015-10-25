<?php
class Calendar extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	
	function setVisit($data = null){
		if($data == null)
		{
			return false;
		}
		else
		{
			$cliId = $data['cliId'];
			$dia = $data['dia'];
			$hora = $data['hora'];
			$min = $data['min'];
			$note = $data['note'];
			
			$dia = explode('-', $dia);

			$insert = array(
				   'vstDate' => $dia[2].'-'.$dia[1].'-'.$dia[0].' '.$hora.':'.$min,
				   'cliId' => $cliId,
				   'vstStatus' => 'PN',
				   'vstNote' => $note
				);

			if($this->db->insert('admvisits', $insert) == false) {
				return false;
			}else{
				return "Se programo la visita para el día <br>".$data['dia']." a las ".$data['hora'].":".$data['min'];
			}
		}
	}

	function cancelVisit($data = null){
		if($data == null)
			{
				return false;
			}
			else
			{
				$update = array();
				$update['vstStatus'] = 'VS';
				//Actualizar estado de visita
				if($this->db->update('admvisits', $update, array('vstId'=>$data['vstId'])) == false) {
					return false;
				}
			}
		return "La visita fue cerrada";
	}
}

?>