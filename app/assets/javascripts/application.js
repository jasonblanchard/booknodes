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
//= require_tree .

$(document).foundation();

$(document).on('click.ideaEvents', 'a.new-idea', function() {
  $('.new-idea-form').slideToggle('fast');
  return false;
});

$(document).on('click.ideaEvents', 'a.expand-sidebar-button', function() {
  $('.mobile.sidebar').toggle("slide", { direction: "left" }, 'fast');
  return false;
});
