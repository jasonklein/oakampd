// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

var OakAmpdBandsJs = OakAmpdBandsJs || {};

// OakAmpdBandsJs.adjustBandImageDivHeights = function () {
//   setTimeout(function() {
//       $(".band-image").each(function(i) {
//       var image = $(this).children("img")[0];
//       var ht = $(image).height();
//       $(this).height(ht);
//     });
//   }, 500);
// }

OakAmpdBandsJs.resizeBandListings = function() {
  $(".band-listing-wrapper").click(function() {
    var img = $(this).find("img")[0];
    var thumgImgSrc = $(img).attr("src");

    if($(this).hasClass("standard")) {
      var imgParent = $(img).parent();
      var fullImgSrc = $(imgParent).data("full");
      $(img).attr("src", fullImgSrc);
      var oldProminent = $("#bands-listings").find(".prominent")[0];
      $(oldProminent).removeClass("prominent").addClass("standard");
      $(this).removeClass("standard").addClass("prominent");
    }
  });
};

OakAmpdBandsJs.setup = function() {
  OakAmpdBandsJs.resizeBandListings();
};

$(OakAmpdBandsJs.setup);