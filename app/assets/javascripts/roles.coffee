$(document).on "ready page:load", ->
  $('.permissions').on 'change', ->
    $.ajax '/roles/'+$('#role_role_id').val()+'/assign_permission', 
    type: 'GET',
    dataType: 'script',
    data: {
      permission: $(this).find('input').first().val()
      status: $(this).checkbox('is checked')
    }