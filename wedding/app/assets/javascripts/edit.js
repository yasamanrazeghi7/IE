$("#main").before("<%= escape_javascript(render "edit", :formats => [:html]) %>");
$("#user-edit").modal();
