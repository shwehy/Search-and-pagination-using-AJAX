


$(document).ready(function(){

    load_data(1);

    function load_data(page, query = '')
    {
      $.ajax({
        url:"pagination.php",
        method:"POST",
        data:{page:page, query:query},
        success:function(data)
        {
          $('#pagination_data').html(data);
        }
      });
    }

    $(document).on('click', '.pagination_link', function(){
        var page = $(this).attr("id");
      var query = $('#search_text').val();
      if(query.length>2){
          load_data(1, query);
      }
      else
         load_data(1);
      // load_data(page, query);
    });

    $('#search_text').keyup(function(){

      var query = $('#search_text').val();
        if(query.length>2){
            load_data(1, query);
        }
        else
           load_data(1);
    });

  });
