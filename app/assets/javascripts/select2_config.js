function select2SingleSelect(dataOptions) {

  $('.select2-single-select').select2('data','');
  $('.select2-single-select').select2('destroy');

  $('.select2-single-select').select2({
    width: '90px',
    createSearchChoice:function(term) {
      return {id:term, text:term};
    },
    data: dataOptions,
    allowClear: true,
    placeholder: 'Page #',
    formatNoMatches:function(term) {
      return "Add a page number"
    }
  });

}

function select2TagSelect() {

  var eventId = $('.event-actions').data('event');

  var request = $.get('/book_events/' + eventId + '/idea_nodes.json', function(response) {
    var options = [];

    $(response).each(function(index, value) {
      options.push({id: value, text: value});
    });

    $('.new_idea .select2-tag-select').select2('data','');
    $('.select2-tag-select').select2('destroy');

    $('.select2-tag-select').select2({
      tags: options,
      width: '100%',
      tokenSeparators: [","]
    })
  });
}

$(document).ready(function() {
  select2TagSelect();
});

$(document).on('page:load', function() {
  select2TagSelect();
});
