$(document).on "ready page:load", ->
  $('.ui.sidebar')
  .sidebar('setting')

  $('#sidebar').click ->
    $('.ui.sidebar').sidebar 'toggle'

  $('.ui.checkbox').checkbox()
  $('.ui.accordion').accordion()