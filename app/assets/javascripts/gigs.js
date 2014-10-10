// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

var OakAmpdGigsJs = OakAmpdGigsJs || {};

OakAmpdGigsJs.showdateDatepicker = function() {
  $('#gig_showdate').datepicker({
    numberOfMonths: 1,
    showButtonPanel: true,
    firstDay: 1,
    dateFormat: "yy-mm-dd"
  });
};


OakAmpdGigsJs.isotopeSorting = function() {

  // init Isotope
  var $container = $('#gigs-listings').isotope({
    layoutMode: 'vertical',
    getSortData: {
      band: '.band',
      venue: '.venue',
      price: '.price parseFloat'
    }
  });

  // bind sort button click
  $('#sort-buttons').on( 'click', 'button', function() {
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



OakAmpdGigsJs.setup = function() {
  OakAmpdGigsJs.showdateDatepicker();
  OakAmpdGigsJs.isotopeSorting();
}

$(OakAmpdGigsJs.setup);
