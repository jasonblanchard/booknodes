function select2SingleSelect(dataOptions) {

  $('.select2-single-select').select2({
    width: '10%',
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
