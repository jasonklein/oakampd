// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

var OakAmpdGigsJs = OakAmpdGigsJs || {};

OakAmpdGigsJs.setDatePickerDefaults = function() {
  $.datepicker.setDefaults({
    numberOfMonths: 1,
    showButtonPanel: true,
    firstDay: 1,
    dateFormat: "yy-mm-dd"
  });
}

OakAmpdGigsJs.showdateDatepicker = function() {
  $('#gig_showdate').datepicker();
};


OakAmpdGigsJs.isotopeSorting = function() {

  // init Isotope
  var $container = $('#gigs-listings').isotope({
    layoutMode: 'vertical',
    getSortData: {
      band: '.band',
      venue: '.venue',
      price: function(g) {
        var price = $(g).find(".price").text();
        if(price.indexOf("TBA") > -1) {
          return parseFloat("-1");
        } else {
          return parseFloat(price);
        }
      }
    }
  });

  // bind sort button click
  $('#sort-buttons').on( 'click', 'button', function() {
    if(!$(this).is('#chronological')) {
      $('.first-of-the-month').hide();
      $('.showdate').addClass('change-showdate-for-sorting');
      $('.last-of-the-month').addClass('change-last-of-the-month-for-sorting');
    } else {
      $('.first-of-the-month').show();
      $('.showdate').removeClass('change-showdate-for-sorting');
      $('.last-of-the-month').removeClass('change-last-of-the-month-for-sorting');
    };
    $(this).blur();
    var sortValue = $(this).attr('data-sort-value');
    $container.isotope({ sortBy: sortValue });
  });

  // change is-checked class on buttons
  $('.button-group').each( function( i, buttonGroup ) {
    var $buttonGroup = $( buttonGroup );
    $buttonGroup.on( 'click', 'button', function() {
      $buttonGroup.find('.is-checked').removeClass('is-checked');
      $( this ).addClass('is-checked');
    });
  });
};

OakAmpdGigsJs.bindBestInPlaceFields = function() {
  $('.best_in_place').best_in_place();
  // $('.best_in_place').bind("ajax:success", function() {
  //   $(this).slideUp();
  // });
};

OakAmpdGigsJs.setup = function() {
  OakAmpdGigsJs.setDatePickerDefaults();
  OakAmpdGigsJs.showdateDatepicker();
  OakAmpdGigsJs.isotopeSorting();
  OakAmpdGigsJs.bindBestInPlaceFields();
  setTimeout(function() { $("#chronological").click() }, 70); // Gaps between listings are removed once sorted
}

$(OakAmpdGigsJs.setup);
