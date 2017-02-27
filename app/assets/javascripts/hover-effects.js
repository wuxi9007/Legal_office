$(document).on('mouseenter', ".select-list-item", function(){
  $(this).prepend('<span class="select-arrow fa fa-angle-right"></span> ');
  $(this).append(' <span class="select-arrow fa fa-angle-left"></span>');
});

$(document).on('mouseleave', ".select-list-item", function(){
  $(this).children('span').remove();
});

$(document).on('mouseenter', ".sec1-list-item", function(){
  $(this).prepend('<span class="select-arrow fa fa-angle-right"></span> ');
  $(this).append(' <span class="select-arrow fa fa-angle-left"></span>');
});

$(document).on('mouseleave', ".sec1-list-item", function(){
  $(this).children('span').remove();
});

$(document).on('mouseenter', ".sec2-list-item", function(){
  $(this).prepend('<span class="select-arrow fa fa-angle-right"></span> ');
  $(this).append(' <span class="select-arrow fa fa-angle-left"></span>');
});

$(document).on('mouseleave', ".sec2-list-item", function(){
  $(this).children('span').remove();
});
