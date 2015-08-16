function WaitingOpen(texto){
	if(texto == '' || texto == null){
		$('#waitingText').html('Cargando');
	}
	else{
		$('#waitingText').html(texto);
	}
	$('#waiting').modal('show');
}

function WaitingClose(){
	$('#waiting').modal('hide');
}