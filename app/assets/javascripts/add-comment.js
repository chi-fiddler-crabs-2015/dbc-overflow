$(document).ready(function(){
  $('.new-comment-form').on("ajax:complete", function(e, data) {
    comment_list = $(this).parent('.add-new-comment')
    comment_list.prepend(data.responseText)
    $("#comment_content").val('')
  })
})
