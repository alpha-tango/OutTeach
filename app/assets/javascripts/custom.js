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
})
