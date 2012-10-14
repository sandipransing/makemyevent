//= require jquery.ui.addresspicker

var filtered_events;

$(document).ready(function() {
if (!this.events)
  $('#search').keyup(function() {
    keyword = $(this).val();
    if(keyword == '')  
      $('.event').show();

    filtered_events = filter_events(events, keyword)

    $('.event').hide();
    filtered_events.forEach(function(e) {
        $('#' + e._id).show();
    }); 
  });
});


function filter_events(collection, keyword) {
    filtered_events = [];

    events.filter(function(e){ 
        if(e.name.toLowerCase().match(keyword.toLowerCase())) 
          filtered_events.push(e); 
    });

    return filtered_events;
}
