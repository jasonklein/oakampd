// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


var OakAmpdVenuesJs = OakAmpdVenuesJs || {};


OakAmpdVenuesJs.LoadVenuesMap = function() {

  var initialize = function() {
    var mapOptions = {
      center: {lat: 37.801565, lng: -122.262418},
      zoom: 12
    };
    var map = new google.maps.Map($("#map-canvas")[0], mapOptions);
    addMarkers(map);
  };

  var addMarkers = function(map) {
    $('address').each(function(i, el) {
      var latitude = $(this).data("latitude");
      var longitude = $(this).data("longitude");
      var title = $(this).data("title");
      var venueListingId = "venue_" + $(this).data("id");
      var position = new google.maps.LatLng(latitude, longitude);
      var marker = new google.maps.Marker({
        position: position,
        map: map,
        title: title
      });
      google.maps.event.addListener(marker, 'click', function() {
        $('html, body').animate({ 'scrollTop': $('#' + venueListingId).offset().top }, 1000);
      });
    });
  };

  if(window.innerWidth > 500) {
    google.maps.event.addDomListener(window, 'load', initialize);
  }
};











OakAmpdVenuesJs.setup = function() {
  OakAmpdVenuesJs.LoadVenuesMap();
};



$(OakAmpdVenuesJs.setup);




