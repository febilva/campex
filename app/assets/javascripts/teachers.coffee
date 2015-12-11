$(document).on "ready page:load", ->
  $('select').on 'change', ->
    if $(this).data('fetch-teacher-periods')
      teacher_id = $('#teacher_id').val()
      date = $('#student_attendance_register_marked_date').val()
      batch_id = $(this).find(':selected').val()
      target_element = '#' + $(this).data('fetch-teacher-periods')
      if batch_id
        $.ajax '/teachers/' + teacher_id + '/batches/'+ batch_id + '/period_list',
        type: 'GET',
        dataType: 'script',
        data: {
          date: date
          target_element: target_element
        }
      else
        $(target_element).empty()