<section class="content">
  <div class="row">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">Reporte de Clientes al Día</h3>
          <hr>
        </div><!-- /.box-header -->
        <div class="box-body">
          <table id="customers" class="table table-bordered table-hover">
            <thead>
              <tr>
                <th>Cliente</th>
                <th>Última Visita</th>
                <th>Saldo a Favor</th>
                <th>Domicilio</th>
              </tr>
            </thead>
            <tbody>
              <?php
                if(count($list) > 0) {                  
                  foreach($list as $a)
                  {
                    echo '<tr>';
                    echo '<td>'.$a['cliLastName'].', '.$a['cliName'].'</td>';
                    $fecha = new DateTime($a['ultima']);
                    echo '<td>'.$fecha->format('d-m-Y H:i').'</td>';
                    echo '<td>'.str_replace('-','',$a['saldo']).'</td>';
                    echo '<td>'.$a['cliAddress'].'</td>';
                    echo '</tr>';
                  }
                }
              ?>
            </tbody>
          </table>
        </div><!-- /.box-body -->
      </div>
    </div>
  </div>
  <a href="assets/reports/clientesAlDia.pdf" id="linkDownload" download>Descargar en formato PDF<i class="fa fa-fw fa-file-pdf-o" style="color: red"></i></a>
  <?php 
  //var_dump($list);
  ?>
</section>

<script>
  $(function () {
    $('#customers').DataTable({
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
        },
      //'ajax': 'index.php/report/slajax'
    });
  });
</script>