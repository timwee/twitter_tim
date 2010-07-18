function update_tweets(data) {
  $("#tweets").prepend(data);
}

$(document).ready(function() {
  $('#message_form').submit(function () {
    $.post(this.action, $(this).serialize(), update_tweets, "html");
    $('#tweet_body').val("");
    return false;
  })
  tweet_submit = $('#tweet_submit');
  tweet_submit.attr("disabled", "disabled")
  $('#tweet_body').keyup(function() {
    if($("#tweet_body").val().length > 0) {
      tweet_submit.removeAttr("disabled");
    } else {
      tweet_submit.attr("disabled", "disabled");
    }
  })
})
