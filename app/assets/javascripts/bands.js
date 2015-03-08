// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

var OakAmpdBandsJs = OakAmpdBandsJs || {};

OakAmpdBandsJs.attachBandListingsClickHandlers = function() {
  $(".band-image").click(function() {
    var bandListingWrapper = $(this).closest(".band-listing-wrapper");
    var oldProminent = $("#bands-listings").find(".prominent")[0];

    if (oldProminent) { $(oldProminent).removeClass("prominent").addClass("standard"); }
    $(bandListingWrapper).removeClass("standard").addClass("prominent");
  });
};

OakAmpdBandsJs.unveilImagesLazily = function() {
  $("body").animate({scrollTop: 2});
  $("img").unveil(20);
};

OakAmpdBandsJs.setup = function() {
  OakAmpdBandsJs.attachBandListingsClickHandlers();
  OakAmpdBandsJs.unveilImagesLazily();
};

$(OakAmpdBandsJs.setup);