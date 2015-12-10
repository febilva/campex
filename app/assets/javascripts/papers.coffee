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

  sort = (element) ->
    sortableList = element
    listitems = $('li', sortableList)
    listitems.sort (a, b) ->
      ta = $(a).data("roll-no").toString()
      tb = $(b).data("roll-no").toString()
      ta.localeCompare tb
    sortableList.append listitems

  $('#available-list, #participants-list').sortable(
    create: (event, ui) ->
      sort $(this)
    update: (event, ui) ->
      sort $(this)
    connectWith: '.sortable-list').disableSelection()

  $('#available-list').on "sortreceive", ( event, ui ) ->
    batch_id = $('#batch').val()
    paper_id = $('#paper').val()
    rm_participant_url = '/batches/' + batch_id + '/papers/' + paper_id + '/remove_participant'

    $.ajax rm_participant_url,
    url: this.href,
    type: 'DELETE',
    dataType: 'script',
    data: {
      student_id: ui.item.attr("id")
    }

  $('#participants-list').on "sortreceive", ( event, ui ) ->
    batch_id = $('#batch').val()
    paper_id = $('#paper').val()
    add_participant_url = '/batches/' + batch_id + '/papers/' + paper_id + '/add_participant'

    $.ajax add_participant_url,
    type: 'POST',
    dataType: 'script',
    data: {
      student_id: ui.item.attr("id")
    }