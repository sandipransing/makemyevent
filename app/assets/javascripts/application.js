// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery-1.8.2
//= require jquery-ui
//= require bootstrap
//= require jquery-ui-timepicker-addon
    

$(document).ready(function(){
  $('.sub_text').keyup(function() {
      var maxChar = 100
      var charLength = $(this).val().length;
      // Displays count
      var count = maxChar - charLength
      $('#charCounter').html('Characters left '+ count +'');
        // Alerts when 250 characters is reached
        if($(this).val().length > maxChar){
          $(this).val($(this).val().substr(0, maxChar));
          $('#charCounter').html('Characters left 0');
          alert('You may only have up to ' + maxChar + ' characters.')
         }
        if($(this).val().length >= 30){
          var msg_title = $(this).val().substr(0, 30)
          $('#msg-title').html(msg_title + '...');
        }else{
          $('#msg-title').html($(this).val())
        }
      });
    var maxChar = 100
    var charLength = $('.sub_text').val().length;
    var count = maxChar - charLength
   $('#charCounter').html('Characters left '+ count +'');
});
