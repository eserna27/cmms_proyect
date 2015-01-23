# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "change", "#floor_number", ->
    floor = $(this).val()
    floor = 0 if floor == ""
    currentPath = location.pathname
    areasPath = "#{currentPath.replace('equipment/new','')}floors/#{floor}/areas.js"
    $.get(areasPath)

$(document).on "change", "#area_id", ->
    area = $(this).val()
    area = 0 if area == ""
    currentPath = location.pathname
    areasPath = "#{currentPath.replace('equipment/new','')}areas/#{area}/subareas.js"
    $.get(areasPath)