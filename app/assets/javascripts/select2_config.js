booknodes.select2 = {

  select2SingleSelect: function(dataOptions) {

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

  },

  select2TagSelect: function() {

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

};

$(document).ready(function() {
 booknodes.select2.select2TagSelect();
});

$(document).on('page:load', function() {
 booknodes.select2.select2TagSelect();
});

