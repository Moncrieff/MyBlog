# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#add_image").on "ajax:success", (event, data) ->
    $("#images").append data
    $(this).data "params", { index: $("#images div.image").length }
