function remove_fields(link) {
  var id = link.id.substring(7,100);
  $("#destroy_"+id).val("true")
  $("#detail_"+id).hide();
}

function add_fields(parent, association, content) {
  var new_id = new Date().getTime();
  $("#"+parent).append(content.replace(/new_row/g, new_id));
}
