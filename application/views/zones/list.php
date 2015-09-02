<input type="hidden" id="permission" value="<?php echo $permission;?>">
<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Zonas</h3>
          <?php
            if (strpos($permission,'Add') !== false) {
              echo '<button class="btn btn-block btn-success" style="width: 100px; margin-top: 10px;" data-toggle="modal" onclick="LoadZone(0,\'Add\')" id="btnAdd">Agregar</button>';
            }
          ?>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="users" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th width="20%">Acciones</th>
                <th>Descripción</th>
              </tr>
            </thead>
            <tbody>
              <?php
              	foreach($list as $z)
    		        {
	                echo '<tr>';                  
                  echo '<td>';
                  if (strpos($permission,'Edit') !== false) {
                      echo '<i class="fa fa-fw fa-pencil" style="color: #f39c12; cursor: pointer; margin-left: 15px;" onclick="LoadZone('.$z['zonaId'].',\'Edit\')"></i>';
                  }
	                if (strpos($permission,'Del') !== false) {
                      echo '<i class="fa fa-fw fa-times-circle" style="color: #dd4b39; cursor: pointer; margin-left: 15px;" onclick="LoadZone('.$z['zonaId'].',\'Del\')"></i>';
                  }
                  if (strpos($permission,'View') !== false) {
                      echo '<i class="fa fa-fw fa-search" style="color: #3c8dbc; cursor: pointer; margin-left: 15px;" onclick="LoadZone('.$z['zonaId'].',\'View\')"></i> ';
                  }
	                		
	                echo '</td>';
	                echo '<td style="text-align: left">'.$z['zonaName'].'</td>';
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
    $('#users').DataTable({
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": true,
        "language": {
              "lengthMenu": "Ver _MENU_ filas por página",
              "zeroRecords": "No hay registros",
              "info": "Mostrando pagina _PAGE_ de _PAGES_",
              "infoEmpty": "No hay registros disponibles",
              "infoFiltered": "(filtrando de un total de _MAX_ registros)",
              "sSearch": "Buscar:  ",
              "oPaginate": {
                  "sNext": "Sig.",
                  "sPrevious": "Ant."
                }
        }
    });
  });

  
  var idZone = 0;
  var acZone = '';
  
  function LoadZone(id_, action){
  	idZone = id_;
  	acZone = action;
  	LoadIconAction('modalAction',action);
  	WaitingOpen('Cargando Zona');
      $.ajax({
          	type: 'POST',
          	data: { id : id_, act: action },
    		url: 'index.php/zone/getZone', 
    		success: function(result){
			                WaitingClose();
			                $("#modalBodyZone").html(result.html);
			                setTimeout("$('#modalZone').modal('show')",800);
    					},
    		error: function(result){
    					WaitingClose();
    					alert("error");
    				},
          	dataType: 'json'
    		});
  }

  
  $('#btnSave').click(function(){
  	
  	if(acZone == 'View')
  	{
  		$('#modalZone').modal('hide');
  		return;
  	}

  	var hayError = false;
    if($('#zonaName').val() == '')
    {
    	hayError = true;
    }

    if(hayError == true){
    	$('#errorZone').fadeIn('slow');
    	return;
    }

    $('#errorUsr').fadeOut('slow');
    WaitingOpen('Guardando cambios');
    	$.ajax({
          	type: 'POST',
          	data: { 
                    id : idZone, 
                    act: acZone, 
                    zone: $('#zonaName').val()
                  },
    		url: 'index.php/zone/setZone', 
    		success: function(result){
                			WaitingClose();
                			$('#modalZone').modal('hide');
                			setTimeout("cargarView('zone', 'index', '"+$('#permission').val()+"');",1000);
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
<div class="modal fade" id="modalZone" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="modalAction"> </span> Zona</h4> 
      </div>
      <div class="modal-body" id="modalBodyZone">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave">Guardar</button>
      </div>
    </div>
  </div>
</div>