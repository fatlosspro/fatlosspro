# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

if $('#landing').is(':visible')
  $('#footer').hide() 
  $('#wrap').addClass('h-overflow')
  $('#main').addClass('h-overflow')
$('#landing').mousewheel -> 
  $(this).slideUp 'slow', ->
    $('#footer').show()
    $('#wrap').removeClass('h-overflow')
    $('#main').removeClass('h-overflow')
$.stellar({
  horizontalScrolling: false,
  verticalOffset: 60
});