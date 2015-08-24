      <aside class="main-sidebar">
        <section class="sidebar">
          <ul class="sidebar-menu">
            <li class="treeview active">
              <a href="#">
                <i class="fa fa-dashboard"></i> <span>Escritorio</span> 
              </a>
            </li>
            <?php 
              
               foreach ($menu as $m) {
                  if(count($m['childrens']) > 0) {
                    echo '<li class="treeview">
                            <a href="#">
                              <i class="'.$m[0]['menuIcon'].'"></i> <span>'.$m[0]['menuName'].'</span>
                              <i class="fa fa-angle-left pull-right"></i>
                            </a>
                            <ul class="treeview-menu">';
                            foreach ($m['childrens'] as $ch) {
                              echo '<li>
                                      <a href="#" onClick="cargarView(\''.$ch['menuController'].'\',\''.$ch['menuView'].'\')">
                                        <i class="'.$ch['menuIcon'].'"></i> '.str_replace("_", " ", $ch['menuName']).' 
                                      </a>
                                    </li>';
                            }
                    echo '</ul>
                        </li>';
                  }
                  else
                  {
                    echo '<li class="treeview">
                            <a href="#" onClick="cargarView(\''.$m['menuController'].'\',\''.$m['menuView'].'\')">
                              <i class="'.$m['menuIcon'].'"></i> <span>'.str_replace("_", " ", $m['menuName']).'</span>
                            </a>
                          </li>';
                  }
                } 
                
            ?>
        </ul>
      </section>
    </aside> 

      <script>
      function cargarView(controller, action)
      {
        WaitingOpen();
        $('#content').empty();
        $("#content").load("<?php echo base_url(); ?>index.php/"+controller+"/"+action+"");
        WaitingClose();
      }
      </script>