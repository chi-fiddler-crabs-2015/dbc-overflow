$(document).ready(function(){
  $('.button_to').on("ajax:complete", function(e, data) {
    $('.button_to').closest(".vote-container > span:first-child").innerHTML(data.responseText)
  })
});
