$(document).ready(function() {

  $('.search').on('click', function() {
    $.post( '/grant_gateway/search', $('#search-form').serialize(), function(data) {
      $('.results').empty()
      for (var i = 0; i < data.length; i++) {
        $('.results').append("<a href='" + data[i].link + "' class='media-links'><div class='media'><div class='media-body'><h5 class='media-heading'>" + data[i].name + "</h5><i class='fa fa-arrow-circle-o-right'></i><br/><p>" + data[i].description + "</p></div></div></a>")
      };
    });
  });

});