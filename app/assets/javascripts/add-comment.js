$(document).ready(function(){
  $('.new-q-comment-form').on("ajax:complete", function(e, data) {
    $(".q-comment").append(data.responseText)
    $("#comment_content").val('')
  })
})

$(document).ready(function(){
  $('.new-a-comment-form').on("ajax:complete", function(e, data) {
    $(".a-comment").append(data.responseText)
    $('.new-a-comment-form #comment_content').val('')
  })
})
