<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


class Backups extends CI_Model
{
	function __construct()
	{
		parent::__construct();
	}
	
	function Backup_List(){

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

	function Backup_Generate(){
		$user="root";
		$pass="";
		$host="localhost";
		$name="docesoles";
		$tables = '*';
		
		   
		$link = mysql_connect($host,$user,$pass);
		mysql_select_db($name,$link);
		   
		//get all of the tables
		if($tables == '*')
		{
		  $tables = array();
		  $result = mysql_query('SHOW TABLES');
		  while($row = mysql_fetch_row($result))
		  {
		     $tables[] = $row[0];
		  }
		}
		else
		{
		  $tables = is_array($tables) ? $tables : explode(',',$tables);
		}
		   
		//cycle through
		$return = '';
		foreach($tables as $table)
		{
		  $result = mysql_query('SELECT * FROM '.$table);
		  $num_fields = mysql_num_fields($result);
		  
		  $return.= 'DROP TABLE IF EXISTS '.$table.';';
		  $row2 = mysql_fetch_row(mysql_query('SHOW CREATE TABLE '.$table));
		  $return.= "\n\n".$row2[1].";\n\n";
		  
		for ($i = 0; $i < $num_fields; $i++)
		  {
		     while($row = mysql_fetch_row($result))
		     {
		        $return.= 'INSERT INTO '.$table.' VALUES(';
		        for($j=0; $j<$num_fields; $j++) 
		        {
		           $row[$j] = addslashes($row[$j]);
		           $row[$j] = preg_replace("/\n/","\\n",$row[$j]);
		           if (isset($row[$j])) { $return.= '"'.$row[$j].'"' ; } else { $return.= '""'; }
		           if ($j<($num_fields-1)) { $return.= ','; }
		        }
		        $return.= ");\n";
		     }
		  }
		  $return.="\n\n\n";
		}
		   
		//save file
		   
		$handle = fopen('assets/backs/db-backup-last.sql','w+');
		fwrite($handle,$return);
		fclose($handle);
		

		return true;
	}
}
?>