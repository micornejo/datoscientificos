// This is a manifest file that'll be compiled into application.js, which will
// include all the files listed below.
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
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){
    /* Setup foundation */
    $(document).foundation();
    /* Setup auth form */
    $(".auth-form").click(function(e) {
	$("#auth-form-modal").foundation('reveal', 'open');
    });
    $(".feedback-form input[type=submit]").click(function(e) {
	$(this).parents('.reveal-modal').foundation('reveal', 'close');
    });
    $("#feedback-link").click(function(e) {
	$("#feedback-modal").foundation('reveal', 'open');
    });
    $("[modal-open]").click(function(e) {
	$($(this).attr('modal-open')).foundation('reveal', 'open');
    });
    $("[modal-close]").click(function(e) {
	$($(this).attr('modal-close')).foundation('reveal', 'close');
    });
});
