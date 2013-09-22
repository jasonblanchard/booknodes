$(document).on('click.ideaEvents', 'a.new-idea', function() {
  $('.new-idea-form').slideToggle('fast');
  return false;
});

$(document).on('click.ideaEvents', 'a.expand-sidebar-button', function() {
  $('.mobile.sidebar').toggle("slide", { direction: "left" }, 'fast');
  return false;
});

// TODO: Change show() to attr('visibility', 'visible')
// Also change in css

  $(document).on('mouseenter', '.idea', function() {
   $(this).find('.edit-button').show();
 });

  $(document).on('click', '.idea', function() {
   $(this).find('.edit-button').show();
 });

  $(document).on('mouseleave', '.idea', function() {
   $(this).find('.edit-button').hide();
  });

  $(document).on('dblclick', '.idea', function() {
    $('.idea').removeClass('editing');
    $(this).addClass('editing')
  });

  $(document).on('click', '.cancel-idea-form', function() {
    $('.idea').removeClass('editing');
    return false;
  });

  $(document).on('click', '.edit-button', function() {
    $('.idea').removeClass('editing');
    $(this).closest('.idea').addClass('editing')
    return false;
  });

  $(document).on('keypress', '.idea', function(e) {
    if (e.keyCode == 13) {
      $(this).find("form").submit();
      e.preventDefault();
    }
  });
