function select2SingleSelect(dataOptions) {

  $('.select2-single-select').select2({
    width: 'element',
    createSearchChoice:function(term) {
      return {id:term, text:term};
    },
    data: dataOptions
  });

}
