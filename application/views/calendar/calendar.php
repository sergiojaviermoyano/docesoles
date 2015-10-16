        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-md-10">
              <div class="box box-primary">
                <div class="box-body no-padding">
                  <!-- THE CALENDAR -->
                  <div id="calendar"></div>
                </div><!-- /.box-body -->
              </div><!-- /. box -->
            </div><!-- /.col -->
            <div class="col-md-2">
              <button class="btn btn-block btn-success" style="width: 100px; margin-top: 10px;" data-toggle="modal" id="btnAdd">Programar</button>
            </div>
          </div><!-- /.row -->
        </section><!-- /.content -->
      
      <script>
        $(function () {

        $('#btnAdd').click(function() {
             //Cargar clientes
             //Elegir fecha y hora(de mañana para adelante )
             //Registrar visita
             //alert(this.id);
            LoadIconAction('modalAction','Program');
            WaitingOpen('Cargando Clientes');
              $.ajax({
                    type: 'POST',
                    data: null,
                    url: 'index.php/dash/getCustommers', 
                    success: function(result){
                                  WaitingClose();
                                  $("#modalBodyProgrammer").html(result.html);
                                  $('#vstFecha').datepicker({minDate: '0'});
                                  setTimeout("$('#modalProgrammer').modal('show');",800);
                                  $(".select2").select2();
                          },
                    error: function(result){
                          WaitingClose();
                          alert("error");
                        },
                    dataType: 'json'
                });
         });

        $('#btnSave').click(function(){
            
            var hayError = false;
            if($('#cliId').val() == -1)
            {
              hayError = true;
            }

            if($('#vstFecha').val() == "")
            {
              hayError = true;
            }

            if(hayError == true){
              $('#error').fadeIn('slow');
              return;
            }

            WaitingOpen('Registrando Visita');
            $.ajax({
                  type: 'POST',
                  data: {
                          cliId: $('#cliId').val(),
                          dia: $('#vstFecha').val(),
                          hora: $('#vstHora').val(),
                          min: $('#vstMinutos').val(),
                          note: $('#vstNote').val()
                        },
                  url: 'index.php/dash/setVisit', 
                  success: function(result){
                                WaitingClose();
                                //$("#modalBodyProgrammer").html(result.html);
                                //$('#vstFecha').datepicker({minDate: '0'});
                                //setTimeout("$('#modalProgrammer').modal('show');",800);
                                //$(".select2").select2();
                                WaitingClose();
                                $('#modalProgrammer').modal('hide');
                                $('#calendar').fullCalendar('refetchEvents');
                        },
                  error: function(result){
                        WaitingClose();
                        alert("error");
                      },
                  dataType: 'json'
              });

        });
        /* initialize the external events
         -----------------------------------------------------------------*/
        function ini_events(ele) {
          ele.each(function () {

            // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
            // it doesn't need to have a start or end
            var eventObject = {
              title: $.trim($(this).text()) // use the element's text as the event title
            };

            // store the Event Object in the DOM element so we can get to it later
            $(this).data('eventObject', eventObject);

            // make the event draggable using jQuery UI
            $(this).draggable({
              zIndex: 1070,
              revert: true, // will cause the event to go back to its
              revertDuration: 0  //  original position after the drag
            });

          });
        }
        ini_events($('#external-events div.external-event'));

        /* initialize the calendar
         -----------------------------------------------------------------*/
        //Date for the calendar events (dummy data)
        var date = new Date();
        var d = date.getDate(),
            m = date.getMonth(),
            y = date.getFullYear();

        $('#calendar').fullCalendar({
          header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
          },
          buttonText: {
            today: 'Hoy',
            month: 'Mes',
            week: 'Semana',
            day: 'Día'
          },
          //Load events pending
          events: function(start, end, timezone, callback) {
                  WaitingOpen('Cargando Visitas');
                  var date_ = new Date($("#calendar").fullCalendar('getDate'));
                  $.ajax({
                      url: 'index.php/customer/visits',
                      data: { month: date_.getMonth() },
                      dataType: 'json',
                      type: 'POST',
                      success: function(doc) {
                          var events = [];
                          $(doc).each(function() {
                            var from = $(this).attr('vstDate');
                            var to = new Date(from);
                            to.setMinutes ( to.getMinutes() + 30 );
                              events.push({
                                  title: $(this).attr('cliLastName') + ',' + $(this).attr('cliName'),
                                  start: $(this).attr('vstDate'), // will be parsed
                                  end: to,
                                  id: $(this).attr('vstId'),
                                  allDay: false,
                                  backgroundColor: $(this).attr('cliColor'),
                                  borderColor: 'black'
                              });
                          });
                          callback(events);
                          WaitingClose();
                      },
                      error: function(doc) {
                        WaitingClose();
                        alert("Error:" + doc);
                      }
                  });
              },
          eventClick: function(event) {
              alert("ok" + event.id);
          },

          editable: true,
          droppable: true, // this allows things to be dropped onto the calendar !!!
          drop: function (date, allDay) { // this function is called when something is dropped

            // retrieve the dropped element's stored Event Object
            var originalEventObject = $(this).data('eventObject');

            // we need to copy it, so that multiple events don't have a reference to the same object
            var copiedEventObject = $.extend({}, originalEventObject);

            // assign it the date that was reported
            copiedEventObject.start = date;
            copiedEventObject.allDay = allDay;
            copiedEventObject.backgroundColor = $(this).css("background-color");
            copiedEventObject.borderColor = $(this).css("border-color");

            // render the event on the calendar
            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
              // if so, remove the element from the "Draggable Events" list
              $(this).remove();
            }

          }
        });

        /* ADDING EVENTS */
        var currColor = "#3c8dbc"; //Red by default
        //Color chooser button
        var colorChooser = $("#color-chooser-btn");
        $("#color-chooser > li > a").click(function (e) {
          e.preventDefault();
          //Save color
          currColor = $(this).css("color");
          //Add color effect to button
          $('#add-new-event').css({"background-color": currColor, "border-color": currColor});
        });
        $("#add-new-event").click(function (e) {
          e.preventDefault();
          //Get value and make sure it is not null
          var val = $("#new-event").val();
          if (val.length == 0) {
            return;
          }

          //Create events
          var event = $("<div />");
          event.css({"background-color": currColor, "border-color": currColor, "color": "#fff"}).addClass("external-event");
          event.html(val);
          $('#external-events').prepend(event);

          //Add draggable funtionality
          ini_events(event);

          //Remove event from text input
          $("#new-event").val("");
        });
      });

      </script>

<!-- Modal -->
<div class="modal fade" id="modalProgrammer" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span id="modalAction"> </span> Visita</h4> 
      </div>
      <div class="modal-body" id="modalBodyProgrammer">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" id="btnSave">Guardar</button>
      </div>
    </div>
  </div>
</div>