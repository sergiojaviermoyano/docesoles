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

			$data = array(
				   'vstDate' => $dia[2].'-'.$dia[1].'-'.$dia[0].' '.$hora.':'.$min,
				   'cliId' => $cliId,
				   'vstStatus' => 'PN',
				   'vstNote' => $note
				);

			if($this->db->insert('admvisits', $data) == false) {
				return false;
			}else{
				return true;
			}
		}
	}
}

?>