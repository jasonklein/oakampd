// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


var OakAmpdVenuesJs = OakAmpdVenuesJs || {};


OakAmpdVenuesJs.LoadVenuesMap = function() {

  var initialize = function() {
    var mapOptions = {
      center: {lat: 37.811453, lng: -122.274627},
      zoom: 8
    };
    var map = new google.maps.map($("#map-canvas"), mapOptions);
    addMarkers(map);
  };

  var addMarkers = function(map) {
    var geocoder = new google.maps.Geocoder();
    var showMarker = function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        var marker = new google.maps.Marker({
          position: results[0],
        })
      }
    };
  };


  google.maps.event.addDomListener(window, 'load', initialize);
};











OakAmpdVenuesJs.setup = function() {

};



$(OakAmpdVenuesJs.setup);




