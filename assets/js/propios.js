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

function ActiveCamera_(){
	  //Nos aseguramos que estén definidas
	//algunas funciones básicas
	window.URL = window.URL || window.webkitURL;
	navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia ||
	function() {
	    alert('Su navegador no soporta navigator.getUserMedia().');
	};

	//Este objeto guardará algunos datos sobre la cámara
	window.datosVideo = {
	    'StreamVideo': null,
	    'url': null
	}

	jQuery('#botonIniciar').on('click', function(e) {

	    //Pedimos al navegador que nos da acceso a 
	    //algún dispositivo de video (la webcam)
	    navigator.getUserMedia({
	        'audio': false,
	        'video': true
	    }, function(streamVideo) {
	        datosVideo.StreamVideo = streamVideo;
	        datosVideo.url = window.URL.createObjectURL(streamVideo);
	        jQuery('#camara').attr('src', datosVideo.url);
	        //Desactivar btn Iniciar 
	        $("#botonDetener").removeAttr("disabled", "disabled");
	        $("#botonFoto").removeAttr("disabled", "disabled");
	        $("#botonIniciar").attr("disabled", "disabled");

	    }, function() {
	        alert('No fue posible obtener acceso a la cámara.');
	    });

	});

	jQuery('#botonDetener').on('click', function(e) {

	    if (datosVideo.StreamVideo) {
	        datosVideo.StreamVideo.stop();
	        window.URL.revokeObjectURL(datosVideo.url);
	        $("#botonDetener").attr("disabled", "disabled");
	        $("#botonFoto").attr("disabled", "disabled");
	        $("#botonIniciar").removeAttr("disabled", "disabled");
	    }

	});

	jQuery('#botonFoto').on('click', function(e) {
	    var oCamara, oFoto, oContexto, w, h;

	    oCamara = jQuery('#camara');
	    oFoto = jQuery('#foto');
	    oCanvas = jQuery('#canvas');
	    w = oCamara.width();
	    h = oCamara.height();
	    oFoto.attr({
	        'width': w,
	        'height': h
	    });
	    oContexto = oFoto[0].getContext('2d');
	    oContexto.drawImage(oCamara[0], 0, 0, w, h);

	    oCanvas.getContext('2d').drawImage(oCamara[0],0,0);
		var imgData = oCanvas.toDataURL('image/png');
		$('#imgCamera').setAttribute('src',imgData);

	});
}


function ActiveCamera() {

	$("#botonDetener").removeAttr("disabled", "disabled");
	$("#botonFoto").removeAttr("disabled", "disabled");
	$("#botonIniciar").attr("disabled", "disabled");
  	init();
  	function init(){
	    var video = document.querySelector('#camara'), canvas = document.querySelector('#foto'), btn = document.querySelector('#botonFoto'), img = document.querySelector('#imgCamera');

	    navigator.getUserMedia = (navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUSerMedia || navigator.msGetUserMedia);

	    if(navigator.getUserMedia){
	      navigator.getUserMedia({video:true},function(stream){
	        video.src = window.URL.createObjectURL(stream);
	        video.play();
	      },function(e){console.log(e)});

	      video.addEventListener('loadedmetadata',function(){canvas.width = video.videoWidth, canvas.height = video.videoHeight;},false);
	      btn.addEventListener('click',function(){
	      	$('#updatePicture').val('1');
	        canvas.getContext('2d').drawImage(video,0,0);
	        var imgData = canvas.toDataURL('image/png');
	        img.setAttribute('src',imgData);

	      });

	    }else{
	      alert("Actualiza tu nvegador");
	    }
  	}
}

function StopCamera() {
	$("#botonDetener").attr("disabled", "disabled");
    $("#botonFoto").attr("disabled", "disabled");
    $("#botonIniciar").removeAttr("disabled", "disabled");

	var video = document.querySelector('#camara');
	navigator.getUserMedia = (navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUSerMedia || navigator.msGetUserMedia);

	if(navigator.getUserMedia){
	      navigator.getUserMedia({video:true},function(stream){
	        video.pause();
	      },function(e){console.log(e)});
	}
}