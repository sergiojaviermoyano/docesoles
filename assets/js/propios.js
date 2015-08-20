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
	}

	$('#'+idTag).html(icon + actt);
}