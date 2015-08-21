function WaitingOpen(texto){
	if(texto == '' || texto == null){
		$('#waitingText').html('Cargando ...');
	}
	else{
		$('#waitingText').html(texto);
	}
	$('#waiting').fadeIn('slow');
}

function WaitingClose(){
	$('#waiting').fadeOut('slow');
}

function LoadIconAction(idTag, action){
	var icon = "";
	var actt = "";

	switch(action){
		case	'Add':
			icon = '<i class="fa fa-fw fa-plus-square" style="color: #00a65a"></i>';
			actt = 'Agregar ';
			break;
		case 	'Edit':
			icon = '<i class="fa fa-fw fa-pencil" style="color: #f39c12;"></i>';
			actt = 'Editar ';
			break;
		case 	'Del':
			icon = '<i class="fa fa-fw fa-times-circle" style="color: #dd4b39;"></i>';
			actt = 'Eliminar ';
			break;
		case 	'View':
			icon = '<i class="fa fa-fw fa-search" style="color: #3c8dbc"></i>';
			actt = 'Consultar ';
			break;
	}

	$('#'+idTag).html(icon + actt);
}