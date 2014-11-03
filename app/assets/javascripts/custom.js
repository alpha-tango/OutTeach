$(document).ready(function(){
  $('select[name="element[type_id]"]').change(function () {
    if($(this).val() == '3') {
      $('#el-url').show();
      $('#el-embed').hide();
      $('#el-content').hide();
    } else if($(this).val() == '4') {
      $('#el-embed').show();
      $('#el-url').hide();
      $('#el-content').hide();
    } else {
      $('#el-content').show();
      $('#el-url').hide();
      $('#el-embed').hide();
    }
  });

  $('#add_new_assignment').click(function(event) {
    event.preventDefault();
    $(this).hide();
    $('.new-assignment').show();
  });

  $('#add_new_quiz').click(function(event) {
    event.preventDefault();
    $(this).hide();
    $('.new-quiz').show();
  });

  $(function(){
    if($('.large-9 #new-assignment #error_explanation').length){
      $('.new-assignment').removeAttr('style');
      $('#add_new_assignment').hide();
    }
  });

  $(function(){
    if($('.large-9 #new-quiz #error_explanation').length){
      $('.new-quiz').removeAttr('style');
      $('#add_new_quiz').hide();
    }
  });
});
