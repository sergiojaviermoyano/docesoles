      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <section class="sidebar">
          <ul class="sidebar-menu">
            <li class="treeview active">
              <a href="#">
                <i class="fa fa-dashboard"></i> <span>Escritorio</span> <!-- <i class="fa fa-angle-left pull-right"></i> -->
              </a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-users"></i>
                <span>Clientes</span>
              </a>
            </li>
            <li>
              <a href="#">
                <i class="fa fa-leanpub"></i> <span>Artículos</span> <!-- <small class="label pull-right bg-green">new</small> -->
              </a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-home"></i>
                <span>Stock</span>
              </a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-money"></i>
                <span>Cuenta Corriente</span>
                <!-- <i class="fa fa-angle-left pull-right"></i> -->
              </a>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-file-picture-o"></i> <span>Reportes</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../forms/general.html"><i class="fa fa-circle-o"></i> Ingresos </a></li>
                <li><a href="../forms/advanced.html"><i class="fa fa-circle-o"></i> Saldos </a></li>
                <li><a href="../forms/editors.html"><i class="fa fa-circle-o"></i> Ventas </a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#">
                <i class="fa fa-key"></i> <span>Seguridad</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                <li><a href="../tables/simple.html"><i class="fa fa-circle-o"></i> Usuarios</a></li>
                <li><a href="#" onClick="cargarView('group','index')"><i class="fa fa-circle-o"></i> Grupos</a></li>
              </ul>
            </li> 
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <script>
      function cargarView(controller, action)
      {
        //alert(controller + ' / ' + action);
        WaitingOpen();
        $('#content').empty();
        $("#content").load("<?php echo base_url(); ?>index.php/"+controller+"/"+action+"");
        WaitingClose();
      }
      </script>