$(document).ready(function(){
  $('.new-answer-form').on("ajax:complete", function(e, data) {
    console.log(data.responseText)
    $('.new-comment-form').last().prepend(data.responseText)
  })
})
