$(document).on('click.ideaEvents', 'a.new-idea', function() {
  $('.new-idea-form').slideToggle('fast');
  return false;
});

$(document).on('click.ideaEvents', 'a.expand-sidebar-button', function() {
  $('.mobile.sidebar').toggle("slide", { direction: "left" }, 'fast');
  return false;
});


$(document).on('click', '.idea', function() {
 $(this).find('.edit-button').attr('visibility','visible');
});

$(document).on('dblclick', '.idea', function() {
  $('.idea').removeClass('editing');
  $(this).addClass('editing');
  // TODO: Only call if form isn't already rendered
  $.get('/book_events/' + $(this).data('event') + '/ideas/' + $(this).data('idea') + '/edit');
});

$(document).on('click', '.cancel-idea-update-form', function() {
  $('.idea').removeClass('editing');
  return false;
});

$(document).on('click', '.edit-button', function() {
  $('.idea').removeClass('editing');
  $(this).closest('.idea').addClass('editing')
  var idea = $(this).closest('.idea');
  $.get('/book_events/' + $(idea).data('event') + '/ideas/' + $(idea).data('idea') + '/edit');
  return false;
});

$(document).on('keypress', '.idea', function(e) {
  if (e.keyCode == 13) {
    $(this).find("form").submit();
    e.preventDefault();
  }
});

$(document).on('submit', 'form.new_idea', function() {
  $(this).find("input[name='commit']").attr('disabled', 'disabled');
  $(this).find('.actions').append("<img src='/images/loading.gif' class='ajax-loader' />");
});

$(document).on('ajax:complete', 'form.new_idea', function() {
  $('form.new_idea').find('.ajax-loader').remove();
  $(".new_idea input[name='commit']").removeAttr('disabled');
});

$(document).on('click', '.idea-list .idea-node', function() {
  $('.mobile.sidebar').hide();
});
