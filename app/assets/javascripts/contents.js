// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

var OakAmpdContentsJs = OakAmpdContentsJs || {};

OakAmpdContentsJs.setupFroala = function() {
  $('#content_gigs_header, #content_venues_header, #content_bands_header, #content_about_header, #content_about_content').editable({
    inlineMode: false,
    imageUpload: false,
    theme: 'dark'
  });
};

OakAmpdContentsJs.setup = function() {
  OakAmpdContentsJs.setupFroala();
}

$(OakAmpdContentsJs.setup);