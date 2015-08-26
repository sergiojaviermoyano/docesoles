
<div class="row">
	<div class="col-xs-12">
		<div class="alert alert-danger alert-dismissable" id="errorCust" style="display: none">
	        <h4><i class="icon fa fa-ban"></i> Error!</h4>
	        Revise que todos los campos esten completos
      </div>
	</div>
</div>
<div class="nav-tabs-custom">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab_1" data-toggle="tab">General</a></li>
    <li><a href="#tab_2" data-toggle="tab">Imagen</a></li>
    <li><a href="#tab_3" data-toggle="tab">Acerca de</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab_1"> <!-- Datos generales del cliente -->
      <div class="row">
        <div class="col-xs-4">
            <label style="margin-top: 7px;">Nro. Cliente: </label>
          </div>
        <div class="col-xs-5">
            <input type="text" class="form-control" placeholder="" id="cliNroCustomer" value="<?php echo $data['customer']['cliNroCustomer'];?>" disabled="disabled" >
          </div>
      </div><br>
      <div class="row">
        <div class="col-xs-4">
            <label style="margin-top: 7px;">Nombre: </label>
          </div>
        <div class="col-xs-5">
            <input type="text" class="form-control" placeholder="Nombre" id="cliName" value="<?php echo $data['customer']['cliName'];?>" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?>  >
          </div>
      </div><br>
      <div class="row">
        <div class="col-xs-4">
            <label style="margin-top: 7px;">Apellido: </label>
          </div>
        <div class="col-xs-5">
            <input type="text" class="form-control" placeholder="Apellido" id="cliLastName" value="<?php echo $data['customer']['cliLastName'];?>" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?>  >
          </div>
      </div><br>
      <div class="row">
        <div class="col-xs-4">
            <label style="margin-top: 7px;">Dni: </label>
          </div>
        <div class="col-xs-5">
            <input type="text" class="form-control" placeholder="12345678" id="cliDni" value="<?php echo $data['customer']['cliDni'];?>" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?>  maxlength="8">
          </div>
      </div><br>
      <div class="row">
        <div class="col-xs-4">
            <label style="margin-top: 7px;">Fec. Nacimiento: </label>
          </div>
        <div class="col-xs-5">
            <input type="text" class="form-control" id="cliDateOfBirth" placeholder="dd-mm-aaaa" value="<?php echo $data['customer']['cliDateOfBirth'];?>" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?> >
          </div>
      </div><br>
      <div class="row">
        <div class="col-xs-4">
            <label style="margin-top: 7px;">Domicilio: </label>
          </div>
        <div class="col-xs-5">
            <input type="input" class="form-control" placeholder="ej: Barrio Los Olivos M/E Casa/23" id="cliAddress" value="<?php echo $data['customer']['cliAddress'];?>" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?>  >
          </div>
      </div><br>
      <div class="row">
        <div class="col-xs-4">
            <label style="margin-top: 7px;">Teléfono: </label>
          </div>
        <div class="col-xs-5">
            <input type="text" class="form-control" placeholder="0264 - 4961020" id="cliPhone" value="<?php echo $data['customer']['cliPhone'];?>" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?> >
          </div>
      </div><br>
      <div class="row">
        <div class="col-xs-4">
            <label style="margin-top: 7px;">Celular: </label>
          </div>
        <div class="col-xs-5">
            <input type="text" class="form-control" placeholder="0264 - 155095888" id="cliMovil" value="<?php echo $data['customer']['cliMovil'];?>" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?> >
          </div>
      </div><br>
      <div class="row">
        <div class="col-xs-4">
            <label style="margin-top: 7px;">Mail: </label>
          </div>
        <div class="col-xs-5">
            <input type="text" class="form-control" placeholder="claudia.perez@hotmail.com" id="cliEmail" value="<?php echo $data['customer']['cliEmail'];?>" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?> >
          </div>
      </div><br>
      <div class="row">
        <div class="col-xs-4">
            <label style="margin-top: 7px;">Zona: </label>
          </div>
        <div class="col-xs-5">
            <select class="form-control" id="zonaId"  <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?> >
              <?php 
                foreach ($data['zone'] as $z) {
                  echo '<option value="'.$z['zonaId'].'" '.($data['customer']['zonaId'] == $z['zonaId'] ? 'selected' : '').'>'.$z['zonaName'].'</option>';
                }
              ?>
            </select>
          </div>
      </div>
    </div>


    <div class="tab-pane" id="tab_2"> <!-- Imagen del cliente -->
      <div id='botonera'>
          <input id='botonIniciar' type='button' value = 'Iniciar'></input>
          <input id='botonDetener' type='button' value = 'Detener'></input>
          <input id='botonFoto' type='button' value = 'Foto'></input>
      </div>
      <div class="contenedor">
          <div class="titulo">Cámara</div>
          <video id="camara" autoplay controls></video>
      </div>
      <div class="contenedor">
          <div class="titulo">Foto</div>
          <canvas id="foto" ></canvas>
      </div>   
    </div>


    <div class="tab-pane" id="tab_3"> <!-- Acerca del cliente -->
      
    </div>
  </div>
</div>