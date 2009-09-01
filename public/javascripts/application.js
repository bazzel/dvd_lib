// See http://henrik.nyh.se/2008/05/rails-authenticity-token-with-jquery
$(document).ajaxSend(function(event, request, settings) {
  if (typeof(AUTH_TOKEN) == "undefined") return;
  // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
  settings.data = settings.data || "";
  settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
});

replace_ids = function(s){
  var new_id = new Date().getTime();
  return s.replace(/NEW_RECORD/g, new_id);
}

$(function(){   
  $('.child a.remove').live('click', function(){
    if (confirm('Are you sure?')){
      $(this).parents('.child').slideUp("normal");
      // Set value of _delete (a hidden tag next to the click a href) attribute to 1 (Rails nested object forms).
      $(this).next().attr('value', '1');
    }
    return false;
  });
  
});