$(document).ready(function() {

  $('.search').on('click', function() {
    $.post( '/grant_gateway/search', $('#search-form').serialize(), function(data) {
      for (var i = 0; i < data.length; i++) {
        $('.results').append("<div class='media'><div class='media-body'><h5 class='media-heading'>" + data[i].name + "</h5></div></div>")
      };
    });
  });

});