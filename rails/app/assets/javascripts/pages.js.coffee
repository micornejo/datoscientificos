# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(".feedback-landing").click (e)->
  $("#feedback-landing-modal").foundation('reveal', 'open')

set_policy_modal = (i)=>
  $(".feedback-policy-#{i}").click (e)->
    $("#feedback-policy-#{i}-modal").foundation('reveal', 'open')

set_policy_modal(i) for i in [10..1]
