$(document).on('ready turbolinks:load', function(){

  var token = $( 'meta[name="csrf-token"]' ).attr( 'content' );

  $.ajaxSetup( {
    beforeSend: function ( xhr ) {
      xhr.setRequestHeader( 'X-CSRF-Token', token );
    }
  });
 $('#add').click(function(){
   $.ajax({
     url: '/events/new',
     type: 'GET',
     dataType: 'script'
   })
 })
  $('#calendar').fullCalendar({
    events: '/events.json',
    header: {
      center: 'addEventButton'
    },

    eventDrop: function(event, delta, revertFunc) {
      if (event.start.format() < moment().format()){
        alert('Imposible')
        revertFunc();
      } else {
        $.ajax({
                url: '/events/' + event.id,
                type: 'PATCH',
                dataType: 'script',
                data: { event: { start: event.start.format() } }
              })
      }
    },
    eventClick: function(event, jsEvent, view) {
      jsEvent.preventDefault()
      $.ajax({
              url: '/events/' + event.id + '/edit',
              type: 'GET',
              dataType: 'script'
            })
    }
  })
})
