<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Grupos</h3>
          <button class="btn btn-block btn-success" style="width: 100px; margin-top: 10px;" data-toggle="modal" onclick="LoadGrp(0,'Add')" id="btnAdd" title="Nuevo">Agregar</button>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="groups" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th width="20%">Acciones</th>
                <th>Nombre</th>
              </tr>
            </thead>
            <tbody>
              <?php
              	foreach($list as $g)
		        {
		                echo '<tr>';
		                echo '<td>
		                		<i class="fa fa-fw fa-pencil" style="color: #f39c12;" title="Editar" onclick="LoadGrp('.$g['grpId'].',\'Edit\')"></i>
		                		<i class="fa fa-fw fa-times-circle" style="color: #dd4b39;" title="Eliminar" onclick="LoadGrp('.$g['grpId'].',\'Del\')"></i>
		                		<i class="fa fa-fw fa-search" style="color: #3c8dbc" title="Consultar" onclick="LoadGrp('.$g['grpId'].',\'View\')"></i> 
		                	  </td>';
		                echo '<td style="text-align: left">'.$g['grpName'].'</td>';
		                echo '</tr>';
		        }
              ?>
            </tbody>
          </table>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section><!-- /.content -->

<script>
  $(function () {
    //$("#groups").DataTable();
    $('#groups').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });

  var idGrupo = 0;
  var acGrupo = '';

  function LoadGrp(id_, action){
  	idGrupo = id_;
  	acGrupo = action;
  	LoadIconAction('modalAction',action);
  	WaitingOpen('Cargando menu');
      $.ajax({
          	type: 'POST',
          	data: { id : id_, act: action },
    		url: 'index.php/group/getMenu', 
    		success: function(result){
			                WaitingClose();
			                $("#modalBodyGrp").html(result.html);
			                setTimeout("$('#modalGrp').modal('show')",800);
    					},
    		error: function(result){
    					WaitingClose();
    					alert("error");
    				},
          	dataType: 'json'
    		});
  }

  $('#btnSave').click(function(){
  	
  	if(acGrupo == 'View')
  	{
  		$('#modalGrp').modal('hide');
  		return;
  	}

  	var hayError = true;
  	var permission = [];
  	$('#permission :checked').each(function() {
        hayError = false;
        permission.push($(this).attr('id'));
    });

    if($('#grpName').val() == '')
    {
    	hayError = true;
    }

    if(hayError == true){
    	$('#errorGrp').fadeIn('slow');
    	return;
    }

    $('#errorGrp').fadeOut('slow');
    WaitingOpen('Guardando cambios');
    	$.ajax({
          	type: 'POST',
          	data: { id : idGrupo, act: acGrupo, name: $('#grpName').val(), options: permission },
    		url: 'index.php/group/setMenu', 
    		success: function(result){
                			WaitingClose();
                			$('#modalGrp').modal('hide');
                			setTimeout("cargarView('group', 'index');",1000);
    					},
    		error: function(result){
    					WaitingClose();
    					alert("error");
    				},
          	dataType: 'json'
    		});
  });
</script>


<!-- Modal -->
<div class="modal fade" id="modalGrp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="modalAction"> </span> Grupo</h4> 
      </div>
      <div class="modal-body" id="modalBodyGrp">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave">Guardar</button>
      </div>
    </div>
  </div>
</div>