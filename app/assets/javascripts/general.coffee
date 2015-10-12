$(document).on "ready page:load", ->
  # Code to handle add new options in select boxes
  $('.add_new_option').each ->
    parent = $(this).parent()
    controller_name = $(this).attr('data-controller')
    action_route = '/'.concat(controller_name, 's', '/new')
    prerequisite_value = if $(this).attr('data-prerequisite') then $('#'
      .concat($(this).attr('data-prerequisite'))).val() else ''

    parent.change (e)->
      selected_option_class = $(this).find(':selected').attr('class')
      if(selected_option_class == "add_new_option")
        $.ajax action_route,
          dataType: 'script'
          data: {
            popup_form: true
            prerequisite: prerequisite_value
            target_id : parent.attr('id')
          }

        $(this).prop('selectedIndex', 0);
        e.preventDefault()