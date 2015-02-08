$(document).ready(function() {

  $('.search').on('click', function() {
    $.post( '/grant_gateway/search', $('#search-form').serialize(), function(data) {
      var total_value = 0;
      $('.results').empty()
      for (var i = 0; i < data.length; i++) {
        $('.results').append("<a href='" + data[i].link + "' class='media-links'><div class='media'><div class='media-body'><h5 class='media-heading'>" + data[i].name + "</h5><i class='fa fa-arrow-circle-o-right'></i><br/><p>" + data[i].description + "</p></div></div></a>")
        if (data[i].amount > 0) {
          total_value += parseInt(data[i].amount)
        };
      };
      console.log(total_value)
      if (total_value > 0) {
        $('.total-value').empty()
        $('.total-value').append("$" + total_value)
      };
      if (data.length == 0) {
        $('.results').append("<p class='no-results'>No Results Found</p>")
      };
    });
  });

});