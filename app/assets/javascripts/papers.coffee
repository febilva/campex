$(document).on "ready page:load", ->
  $('select').on 'change', ->
    if $(this).data('fetch-paper-teachers')
      paper_id = $(this).find(':selected').val()
      target_element = '#' + $(this).data('fetch-paper-teachers')
      if paper_id
        $.ajax '/papers/' + paper_id + '/teacher_list',
        type: 'GET',
        dataType: 'script',
        data: {
          target_element: target_element
        }
      else
        $(target_element).empty()