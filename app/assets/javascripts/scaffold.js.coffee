$(document).on 'ready page:load', ->
  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'Sin resultados'
    width: '100%'


