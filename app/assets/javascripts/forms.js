$(document).on('change', '.select_company', function(){
  if($(".select_company:eq(0) option:selected").text() == $(".select_company:eq(1) option:selected").text() && $(".select_company:eq(0) option:selected").text() != '--Select--'){
    alert("Cant' be the same company!");
    ind = $(".select_company").index($(this));
    $(".select_company:eq(" + ind +") option:selected").removeAttr("selected");
  }
  if($(".select_company:eq(1) option:selected").text() != '--Select--'){
  	$('#filter_pass').show();
  	var href = $('#filter_pass').attr('href');
  	$('#filter_pass').attr('href', href + "?c2=" + $(".select_company:eq(1) option:selected").val());
  }
});

$(document).on('click', '.select-element', function(){
  $('.element-chosen').removeClass('element-chosen');
  $(this).addClass('element-chosen');
  $('#p-id').val($(this).attr('per-id'));
});