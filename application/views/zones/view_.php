<div class="row">
	<div class="col-xs-12">
		<div class="alert alert-danger alert-dismissable" id="errorZone" style="display: none">
	        <h4><i class="icon fa fa-ban"></i> Error!</h4>
	        Revise que todos los campos esten completos
      </div>
	</div>
</div>
<div class="row">
	<div class="col-xs-4">
      <label style="margin-top: 7px;">Descripción: </label>
    </div>
	<div class="col-xs-5">
      <input type="text" class="form-control" placeholder="Zona" id="zonaName" value="<?php echo $data['zone']['zonaName'];?>" <?php echo ($data['read'] == true ? 'disabled="disabled"' : '');?>  >
    </div>
</div><br>
</div>