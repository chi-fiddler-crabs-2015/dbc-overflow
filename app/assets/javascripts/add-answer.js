$(document).ready(function(){
  $('.new-answer-form').on("ajax:complete", function(e, data) {
    $('.all-answer').append(data.responseText)
    $("#answer_content").val("")
  })
})
