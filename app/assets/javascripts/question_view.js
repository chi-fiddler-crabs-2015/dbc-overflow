$(document).ready(function() {
  $(".new-comment-form").on("ajax:complete", function(e, data){
    last_comment = $(this).closest();
    last_comment.append(data.responseText);
  });
});