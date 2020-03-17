$(document).ready(function(){
    $('[name=native]').on('keyup',function(){
        if($(this).val().length>1){
          $.ajax({
                type: 'get',
                url: '/users/index',
                data: {native: $(this).val() },
                dataType: 'script'
                  });
        }
        if($(this).val().length == 0){
      $.ajax({
        type: "get",
        url: "/users/index",
        dataType: "script"
      });
    }
  })
})
