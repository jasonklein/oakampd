// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

var OakAmpdBandsJs = OakAmpdBandsJs || {};

OakAmpdBandsJs.attachBandListingsClickHandlers = function() {
  $(".band-image").click(function() {
    var thisBandListingWrapper = $(this).closest(".band-listing-wrapper");
    var oldProminent = $("#bands-listings").find(".prominent")[0];

    if($(thisBandListingWrapper).hasClass("prominent")) {
      $(thisBandListingWrapper).toggleClass("prominent");
    } else {
      if (oldProminent) { $(oldProminent).toggleClass("prominent"); }
      $(thisBandListingWrapper).toggleClass("prominent");
    }
  });
};

OakAmpdBandsJs.unveilImagesLazily = function() {
  $("body").animate({scrollTop: 2});
  $("img").unveil(20);
};

OakAmpdBandsJs.displayBandsByTag = function() {
  $(document).on('click', '#tags-list li', function() {
    var tag = $(this).data("tag");

    if(!$(this).hasClass("filter-tag")) {
      $(".filter-tag").removeClass("filter-tag");
      $(this).addClass("filter-tag");
      $.ajax({
        data: {
          tag: tag
        }
      });
    }
  });
};

OakAmpdBandsJs.setup = function() {
  OakAmpdBandsJs.attachBandListingsClickHandlers();
  OakAmpdBandsJs.unveilImagesLazily();
  OakAmpdBandsJs.displayBandsByTag();
};

$(OakAmpdBandsJs.setup);