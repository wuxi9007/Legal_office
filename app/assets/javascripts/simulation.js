$(document).on('click', '.slide-list', function(){
  if($(this).attr('class').indexOf("opened") == -1){
    $(this).children('div').animate({"left": '-=80'}, 0);
    $(this).children('ul').slideDown();
    $(this).addClass('opened');
  }else{
    $(this).children('div').animate({"left": '+=80'}, 0);
    $(this).children('ul').slideUp(0);
    if($(this).children('ul').children('.choosed').text()!=""){
      $(this).children().children('span').html($(this).children('ul').children('.choosed').text());
    }
    $(this).removeClass('opened');
  }
  if($(this).attr('class').indexOf('per-box')!= -1){
    $('#section-2 .per-box').removeClass('border-bot');
    if($('#section-2 .box-selected').attr('class')!=null && $(this).attr('class').indexOf('box-selected')==-1){
      if($('#section-2 .box-selected').attr('class').indexOf('opened') != -1){
        $('#section-2 .box-selected').children('div').animate({"left": '+=80'}, 0);
        $('#section-2 .box-selected').children('ul').slideUp(0);
        $('#section-2 .box-selected').removeClass('opened');
      }
    }
    $('#section-2 .box-selected').removeClass('box-selected');
    $(this).addClass('box-selected');
  }
  $("div[class*='boxes-']").css('background', "#000000");
  $(".test-result").remove();
});

$(document).on('click', '.officer-slide-list', function(){
  if($(this).attr('class').indexOf('opened') == -1){
    $(this).children('div').animate({"left": '-=80'}, 0);
    $(this).children('ul').slideDown();
    $(this).addClass('opened');
  }else{
    $(this).children('div').animate({"left": '+=80'}, 0);
    $(this).children('ul').slideUp(0);
    if($(this).children('ul').children('.choosed').text()!=""){
      $(this).children().children('.show-text').html(":" + $(this).children('ul').children('.choosed').text());
    }
    $(this).removeClass('opened');
  }
  $(".test-result").remove();
});

$(document).on('click', '.role-box', function(){
  $('#role').val($('.role-box').index($(this)));
  if($(this).attr('id').indexOf('per') == -1){
    $('#show_name').html("PERSONNEL");
    $('.choosed').removeClass('choosed');
    if($('#per').attr('class').indexOf('opened') != -1){
      $('#per-icon').animate({"left": '+=80'}, 0);
      $('#per-list').slideUp(0);
      $('#per').removeClass('opened');
    }
    if($('.role-box').index($(this))==2){
      $('#section-2').html('<h1 style="display:inline-block">Test Assignment</h1><div class="test-btn" style="display:inline-block;float:right"></div>');
    }else if($('.role-box').index($(this))==1){
      $('#section-2').html('<h1 style="display:inline-block">View Records</h1><div class="test-btn" style="display:inline-block;float:right"></div>');
    }
    $('#section-2').append($("div[href*='"+$(this).attr('id')+"']").clone());
  }
  $("div[class*='boxes-']").css('background', "#000000");
  $(".test-result").remove();
  $('.box-selected').removeClass('box-selected');
  $('.role-box').removeClass('border-bot');
  $(this).addClass('box-selected');
});

$(document).on('click', ".select-list-item", function(){
  $('.choosed').removeClass('choosed');
  $(this).addClass('choosed');
  $('#personnel-from-id').val($(this).attr('pass_id'));
  $('#section-2').html('<h1 style="display:inline-block">Select Options</h1><div class="test-btn" style="display:inline-block;float:right"></div>');
  $('#section-2').append($("div[href*='per']").clone());
});

$(document).on('click', ".sec1-list-item", function(){
  $(this).siblings(".choosed").removeClass('choosed');
  $(this).addClass('choosed');
  var which_select = $(this).parent().attr('id');
  if(which_select.indexOf("contact") != -1){
    $('#personnel-to-id').val($(this).attr('pass_id'));
    $('#section-2>.test-btn').html("<input type='submit' name='type' value='Confirm Contacting "+$(this).text()+"' class='blue-btn glow'/>");
  }
  if(which_select.indexOf("document") != -1){
    $('#doc-id').val($(this).attr('pass_id'));
    $('#section-2>.test-btn').html("<input type='submit' name='type' value='Confirm Retrieving "+$(this).text()+"' class='blue-btn glow'/>");
  }
});

$(document).on('click', ".sec2-list-item", function(){
  $(this).siblings(".choosed").removeClass('choosed');
  $(this).addClass('choosed');
  if($(this).parent().attr('class').indexOf('check') == -1){
    $(this).parent().addClass('check');
  }
  var which_select = $(this).parent().attr('id');
  if(which_select.indexOf("def-list") != -1){
    $('#def-company').val($(this).attr('pass_id'));
  }
  if(which_select.indexOf("off-list") != -1){
    $('#off-company').val($(this).attr('pass_id'));
  }
  if(which_select.indexOf("law-list") != -1){
    $('#officer-personnel-id').val($(this).attr('pass_id'));
  }
  if($('.check').size() ==3){
    $('#section-2>.test-btn').html("<input type='submit' value='Assignment Test' class='blue-btn glow'/>");
  }
});