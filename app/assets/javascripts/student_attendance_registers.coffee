$(document).on "ready page:load", ->
  $('select').on 'change', ->
    if $(this).data('fetch-period-students')
      date = $('#marked_date_disabled_1i').val() + "-" + 
      $('#marked_date_disabled_2i').val() + "-" +
      $('#marked_date_disabled_3i').val()
      batch_id = $('#student_attendance_register_batch_id').val()
      period_id = $('#student_attendance_register_period_id').val()
      paper_id = $('#student_attendance_register_paper_id').val()
      target_element = '#' + $(this).data('fetch-period-students')
      if period_id
        $.ajax '/batches/' + batch_id + '/students_list',
        type: 'GET',
        dataType: 'script',
        data: {
          date: date
          period_id: period_id
          paper_id: paper_id
          target_element: target_element
        }
      else
        $(target_element).empty()


  $('.ui.absence.checkbox').click ->
    elm = $(this).parents('.stud-name').find('.status');

    if (elm.hasClass('olive'))
      elm.addClass('red').removeClass('olive').text('Absent')
    else
      elm.addClass('olive').removeClass('red').text('Present')