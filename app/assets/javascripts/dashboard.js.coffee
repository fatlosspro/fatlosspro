# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$.fn.extend({

  update_crop: (coords) ->
    rx = 100/coords.w
    ry = 100/coords.h
    w_orig = $('#w_original').text()

    $("#crop_x").val Math.round(coords.x)
    $("#crop_y").val Math.round(coords.y)
    $("#crop_w").val Math.round(coords.w)
    $("#crop_h").val Math.round(coords.h)
})


$(document).ready ->
  $('.form-trigger').fancybox({
    closeBtn: true
    arrows: false
    padding: 40
  })

  if $('#crop').length > 0
    $.fancybox.open('#crop', 
      {
        padding: 20
        scrolling:no
        autoCenter:true
        fitToView: false        
      })

$('#cropbox').Jcrop({
  onChange: $.fn.update_crop
  onSelect: $.fn.update_crop
  setSelect: [0, 0, 400, 400]
  aspectRatio: 1
  boxWidth: 400
  boxHeight: 400
})

# Chart stuff

ctx = $('.weight-chart').get(0).getContext("2d")

dataLabels = JSON.parse($('#labels').text())
dataPoints = JSON.parse($('#points').text())

data = {
  labels: dataLabels
  datasets: [{

    fillColor : "rgba(198,198,198,0.5)",
    strokeColor : "rgba(255,96,0,1)",
    pointColor : "#e5e5e5",
    pointStrokeColor : "#ff6000",
    data : dataPoints
  
  }]
}

options = {
  scaleFontFamily : "'Titillium Web'"
}
weightChart = new Chart(ctx).Line(data,options)
