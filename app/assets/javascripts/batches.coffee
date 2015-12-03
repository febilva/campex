$(document).on "ready page:load", ->
  $('select').on 'change', ->
    if $(this).data('fetch-batch-papers')
      batch_id = $(this).find(':selected').val()
      target_element = '#' + $(this).data('fetch-batch-papers')
      if batch_id
        $.ajax '/batches/' + batch_id + '/paper_list',
        type: 'GET',
        dataType: 'script',
        data: {
          target_element: target_element
        }
      else
        $(target_element).empty()