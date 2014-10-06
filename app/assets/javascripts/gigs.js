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

OakAmpdGigsJs.setup = function() {
  OakAmpdGigsJs.showdateDatepicker();
}

$(OakAmpdGigsJs.setup);
