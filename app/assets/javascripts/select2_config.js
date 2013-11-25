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

function select2TagSelect(dataOptions) {

  $('.new_idea .select2-tag-select').select2('data','');
  $('.select2-tag-select').select2('destroy');

  $('.select2-tag-select').select2({
    tags: dataOptions,
    width: '100%',
    tokenSeparators: [","]
  })
}
