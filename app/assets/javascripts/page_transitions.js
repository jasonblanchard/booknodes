NProgress.configure({
  showSpinner: false
});

$(document).on('page:fetch', function() {
  $('.content').fadeOut(50);
});

$(document).on('page:change', function() {
  $('.content').fadeIn(50);
});

$(document).on('page:restore', function() {
  $('.content').fadeIn(50);
});
