<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Doce Soles</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.4 -->
    <link rel="stylesheet" href="<?php  echo base_url();?>assets/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- <link rel="stylesheet" href="<?php  echo base_url();?>assets/css/font-awesome.min.css"> -->
    <!-- Theme style -->
    <link rel="stylesheet" href="<?php  echo base_url();?>assets/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="<?php  echo base_url();?>assets/plugin/iCheck/square/blue.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="<?php  echo base_url();?>assets/css/ionicons.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="<?php  echo base_url();?>assets/css/skins/_all-skins.min.css">

    <link rel="stylesheet" href="<?php  echo base_url();?>assets/css/square/green.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery 2.1.4 -->
    <script src="<?php  echo base_url();?>assets/plugin/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.4 -->
    <script src="<?php  echo base_url();?>assets/js/bootstrap.min.js"></script>
    <!-- iCheck -->    
    <script src="<?php  echo base_url();?>assets/plugin/iCheck/icheck.min.js"></script>
    <!-- funciones comunes al sistema -->
    <script src="<?php  echo base_url();?>assets/js/propios.js"></script>

    <!-- FastClick -->
    <script src="<?php  echo base_url();?>assets/plugin/fastclick/fastclick.min.js"></script>
    <!-- AdminLTE App -->
    <script src="<?php  echo base_url();?>assets/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="<?php  echo base_url();?>assets/js/demo.js"></script>

    <script src="<?php  echo base_url();?>assets/plugin/datatables/jquery.dataTables.min.js"></script>
    <script src="<?php  echo base_url();?>assets/plugin/datatables/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="<?php  echo base_url();?>assets/plugin/slimScroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="<?php  echo base_url();?>assets/plugin/fastclick/fastclick.min.js"></script>

    <!-- Select2 -->
    <link rel="stylesheet" href="<?php  echo base_url();?>assets/plugin/select2/select2.css">
    <!-- Select2 -->
    <script src="<?php  echo base_url();?>assets/plugin/select2/select2.js"></script>

    <!--
    <script src="<?php  echo base_url();?>assets/plugin/input-mask/jquery.inputmask.js"></script>
    <script src="<?php  echo base_url();?>assets/plugin/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="<?php  echo base_url();?>assets/plugin/input-mask/jquery.inputmask.extensions.js"></script>
    -->

    <link rel="stylesheet" href="<?php  echo base_url();?>assets/css/jquery-ui.css">
    <script src="<?php  echo base_url();?>assets/js/jquery-ui.js"></script>    

  </head>


<!-- indicador de carga -->
  <div class="waiting" id="waiting">
      <div style="top: 45%; left: 45%; position: inherit;">
          <!--<div class="progress progress active">
            <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 100%"></div>
          </div>-->

          <div class="box box-success" style="width: 200px; text-align: center;">
                <br>
                <br>
                <br>
                <div class="box-header">
                  <h3 class="box-title" id="waitingText">Cargando...</h3>
                </div>
                <!-- Loading (remove the following to stop the loading)-->
                <div class="overlay">
                  <i class="fa fa-refresh fa-spin"></i>
                </div>
                <!-- end loading -->
              </div>
      </div>
  </div>

<style>
  .waiting
  {
    background-color: black;
    display: block;
    position: absolute;
    z-index: 50000;
    overflow: auto;
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
    filter: alpha(opacity=50);
    opacity: 0.5;
    bottom: 0;
    left: 0;
    right: 0;
    top: 0;
    display: none;
  }
</style>

<script>

/* Inicialización en español para la extensión 'UI date picker' para jQuery. */
/* Traducido por Vester (xvester@gmail.com). */
(function( factory ) {
    if ( typeof define === "function" && define.amd ) {

        // AMD. Register as an anonymous module.
        define([ "../widgets/datepicker" ], factory );
    } else {

        // Browser globals
        factory( jQuery.datepicker );
    }
}(function( datepicker ) {

datepicker.regional['es'] = {
    closeText: 'Cerrar',
    prevText: '&#x3C;Ant',
    nextText: 'Sig&#x3E;',
    currentText: 'Hoy',
    monthNames: ['enero','febrero','marzo','abril','mayo','junio','julio','agosto','septiembre','octubre','noviembre','diciembre'],
    monthNamesShort: ['ene','feb','mar','abr','may','jun','jul','ago','sep','oct','nov','dic'],
    dayNames: ['domingo','lunes','martes','miércoles','jueves','viernes','sábado'],
    dayNamesShort: ['dom','lun','mar','mié','jue','vie','sáb'],
    dayNamesMin: ['D','L','M','X','J','V','S'],
    weekHeader: 'Sm',
    dateFormat: 'dd-mm-yy',
    firstDay: 1,
    isRTL: false,
    showMonthAfterYear: false,
    yearSuffix: ''};
datepicker.setDefaults(datepicker.regional['es']);

return datepicker.regional['es'];

}));

</script>