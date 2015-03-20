$('.button_to').on("ajax:complete", function(e, data) {
    console.log(data.responseText)
    $('.new-comment-form').last().prepend(data.responseText)
    // comment_list = $(this).parent('.add-new-comment')
    // comment_list.prepend(data.responseText)
    // $("#comment_content").val('')
  })
