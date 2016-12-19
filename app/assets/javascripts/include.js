//= require skel
//= require util
//= require main
//= require bootstrap-select
//= require moment

function ayantoggle(){
  $(".forgot").slideToggle('slow');
}
$(document).on('turbolinks:load', function() {
  $('.datepicker').datetimepicker();
  $('#event_rq_form').submit(function() {
    var days = $("#days").val();
    if(days.lenth == 0 || parseInt(days)<=0){days=0}
    $("#txt_duration").val(days + " Days, " + $("#hour").val() + " Hours");
  });
});
$(document).ready(function(){
  $('#errorModal').modal("show");
});
