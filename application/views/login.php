<body class="login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="../../index2.html"><b>Doce</b>Soles</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">Ingreso</p>
        <div>
          <div class="form-group has-feedback">
            <input type="email" class="form-control" placeholder="Usuario">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" placeholder="Contraseña">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
              
            </div><!-- /.col -->
            <div class="col-xs-4">
              <button class="btn btn-primary btn-block btn-flat" id="login">Ingresar</button>
            </div><!-- /.col -->
          </div>
        </div>

      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->
</body>

          


  <script>
  
  //A este script despùes llevarlo a un archivo js
  $('#login').click(function(){
    	WaitingOpen('Validando datos de acceso');
      $.ajax({
          type: 'POST',
          data: null,
    			url: 'index.php/login/sessionStart', 
    			success: function(result){
                window.location.href = 'dash';
                if(result == 0){
                  //Error
                }else{
                  //OK, pero deberìa redireccionar desde el controller
                }
    					},
    			error: function(result){
            debugger;
    					alert("error");
    					},
          dataType: 'json'
    		});
  });

  </script>