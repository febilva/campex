$(document).on "ready page:load", ->
  $('select').on 'change', ->
    if $(this).data('fetch-course-syllabuses')
      course_id = $(this).find(':selected').val()
      target_element = '#' + $(this).data('fetch-course-syllabuses')
      if course_id
        $.ajax '/courses/' + course_id + '/syllabuses',
        type: 'GET',
        dataType: 'script',
        data: {
          target_element: target_element
        }
      else
        $(target_element).empty()

    if $(this).data('fetch-course-terms')
      course_id = $(this).find(':selected').val()
      target_element = '#' + $(this).data('fetch-course-terms')
      if course_id
        $.ajax '/courses/' + course_id + '/terms',
        type: 'GET',
        dataType: 'script',
        data: {
          target_element: target_element
        }
      else
        $(target_element).empty()

    if $(this).data('fetch-course-batches')
      course_id = $(this).find(':selected').val()
      target_element = '#' + $(this).data('fetch-course-batches')
      if course_id
        $.ajax '/courses/' + course_id + '/batches',
        type: 'GET',
        dataType: 'script',
        data: {
          target_element: target_element
        }
      else
        $(target_element).empty()

        