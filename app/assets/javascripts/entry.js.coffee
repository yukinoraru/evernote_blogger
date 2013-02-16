# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

@append_img = (parent, hash) ->
  img = $('<img>')
  img.attr("src", "/resource/" + parent.data('hash'))
  parent.append img

$(window).load ->
  $.each $('.resource'), ->
    switch $(this).data('type')
      when "image/png", "image/jpg"
        @append_img $(this), $(this).data('hash')
