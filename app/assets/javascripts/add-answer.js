$(document).ready(function(){

  $(".question-page").on("submit", ".new_answer", function(e){
    // console.log(e)
    e.preventDefault();

    var form = $(this);
    var url = form.attr('action');
    var data = form.serialize();

    $.ajax({
      url: form.attr('action'),
      method: "post",
      data: form.serialize(),
      dataType: "html",
      success: function(response) {
        console.log(response);
        $(".new-answer").hide(".new-answer")
        $(".all-answer").append(response)
      },
      error: function(response) {
        console.log("ERRORS");
      }
    });
    // $.post(url, data)
    //   .success(function(response) {
    //     console.log(response);
    //   });

  });

})
