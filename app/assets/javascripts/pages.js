$(document).on('ready turbolinks:load', function(){
		  var token = $( 'meta[name="csrf-token"]' ).attr( 'content' );
			$.ajaxSetup( {
			  beforeSend: function ( xhr ) {
			    xhr.setRequestHeader( 'X-CSRF-Token', token );
			  }
			});

		    $('#calendar').fullCalendar({
			events: "/events.json",

		      eventDrop: function(event, delta, revertFunc) {
			if(event.start.format()< moment().format()){
			  alert('ńo no no')
			revertFunc();
			}
			else {
			  console.log(delta);
			  $.ajax({
			    url: '/events/' + event.id,
			    type: 'PATCH',
			    dataType: 'JSON',
			    data: { event: {start: event.start.format() } }
			    })
			    }
			    $('#calendar').fullCalendar('refetchEvents')
			  }
		    })
		})
		 
