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

OakAmpdBandsJs.attachBandListingsClickHandlers = function() {
  $(".standard").click(function() {
    var img = $(this).find("img")[0];
    var thumgImgSrc = $(img).attr("src");
    var imgParent = $(img).parent();
    var fullImgSrc = $(imgParent).data("full");
    var oldProminent = $("#bands-listings").find(".prominent")[0];
    var oldProminentClose = $(oldProminent).children(".close")[0];
    var newProminentClose = $(this).children(".close")[0];

    $(img).attr("src", fullImgSrc);
    $(oldProminentClose).css("display", "none");
    $(oldProminent).removeClass("prominent").addClass("standard");
    $(this).removeClass("standard").addClass("prominent");
    $(newProminentClose).css("display", "initial");
  });
};

OakAmpdBandsJs.attachProminentCloseClickHandlers = function() {
  $(".close").click(function() {
    var oldProminent = $(this).parent();
    console.log(oldProminent);
    $(this).css("display", "none");
    $(oldProminent).removeClass("prominent").addClass("standard");
  });
};

OakAmpdBandsJs.setup = function() {
  OakAmpdBandsJs.attachBandListingsClickHandlers();
  OakAmpdBandsJs.attachProminentCloseClickHandlers();
};

$(OakAmpdBandsJs.setup);