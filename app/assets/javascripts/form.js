$(document).ready(function() {
  $.get( "/grant_gateway/data.json", function( data ) {


    // for (var i = 0; i < data[0].length; i++) {
    //   console.log(data[1][i])
    //   $('.form-group').append("<label for='sel1'>" + data[0][i].text  + ":</label>")
    //   .append("<select class='form-control' id='sel1'></select>")
    // };


  });

});