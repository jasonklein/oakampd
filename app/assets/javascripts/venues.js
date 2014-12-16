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
      var latitude = $(el).data("latitude");
      var longitude = $(el).data("longitude");
      var title = $(el).data("title");
      var venueListingId = "#venue_" + $(el).data("id");
      var position = new google.maps.LatLng(latitude, longitude);
      var marker = new google.maps.Marker({
        position: position,
        map: map,
        title: title
      });
      google.maps.event.addListener(marker, 'click', function() {
        $('.selected-venue').attr('class', 'backing venue-listing');
        $('html, body').animate({ 'scrollTop': $(venueListingId).offset().top - 8 }, 1000);
        $(venueListingId).attr('class', 'venue-listing selected-venue');
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




