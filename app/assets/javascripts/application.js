// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.ui.effect.all
//= require jquery_ujs
//= require jquery.remotipart
//= require foundation
//= require turbolinks
//= require rails-timeago
//= require select2
//= require_tree .

var ready = function() {
  $(document).foundation();
}

$(ready);

// Hack-around to get Foundation to re-bind topbar stuff
$(document).on('page:load', function() {
  $(document).foundation('off');
  ready();
});

$(document).on('page:fetch', function() {
  $('.content').fadeOut(50);
  $('.processing').show();
});

$(document).on('page:change', function() {
  $('.content').fadeIn(50);
});

$(document).on('page:restore', function() {
  $('.content').fadeIn(50);
  $('.processing').hide();
});


// $('.content').html("<img src='/images/loading.gif' class='loader' />");
