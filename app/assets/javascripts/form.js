$(document).ready(function() {
  $.get( "/grant_gateway/data.json", function( data ) {
    console.log( "Data Loaded: " + data );
  });

});