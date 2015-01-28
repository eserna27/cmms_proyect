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

$(document).on "change", "#equipment_type_id", ->
    id = $(this).val()
    $("#hidden-fields").find("#equipment_equipment_type_id").val(id);

$(document).on "change", "#brand_id", ->
    id = $(this).val()
    $("#hidden-fields").find("#equipment_brand_id").val(id);

$(document).on "change", "#subarea_id", ->
    id = $(this).val()
    $("#hidden-fields").find("#equipment_subarea_id").val(id);