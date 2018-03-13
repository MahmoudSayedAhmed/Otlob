function addGroup(){
  gName = $("#group").val()
    $.ajax({ 
        method: 'post',
        url: '/groups', 
        data: {name:gName, user_id: parseInt($("#user_id").val()), authenticity_token:$('meta[name="csrf-token"]').attr("content")},
        success: function(result){$("#groupsList").append('<tr><td>'+result["str"]+'<td><i class="fa fa-user-plus" style="font-size:36px;color:blue" onclick="editGroup(this)"></i></td><td><i id="'+result["id"]+'" class="fa fa-remove" style="font-size:36px;color:red" onclick="deleteGroup(this)"></i></td>')}
    })
}


function addFriendToGroup(){
  fname = $("#friend").val()
    $.ajax({ 
        method: 'post',
        url: '/friendships_groups', 
        data: {friendName:fname, group_id:$('#edittingGroup').attr('gid'), authenticity_token:$('meta[name="csrf-token"]').attr("content")},
        dataType: "json",
        success: function(result){$("#friendList").append('<p>'+result["str"]+'</p>')}
    })
}


function editGroup(e){
  var ID = $(e).parent().next().children().attr('id')
  var gName = $(e).parent().prev().text()
  $('#edittingGroup').empty();
  $('#edittingGroup').attr('gid', ID);
  $('#edittingGroup').append('<h3 id="gname">'+gName+'</h3><p>your friend name</p><input id="friend"><button onclick="addFriendToGroup()">add</button><div id="friendList"></div>');
  $.ajax({
    url: '/groups/'+ID,
    data: {authenticity_token:$('meta[name="csrf-token"]').attr("content")},
    success: function(result){
      $("#friendList").empty()
      for (var i=0; i<result["list"].length; i++)
        $("#friendList").append('<p>'+result["list"][i]+'</p>')
    }
  });
}


function deleteGroup(e){
  var gName = $(e).parent().prev().prev().text()
  console.log($("#gname").text(), gName)
  if(gName == $("#gname").text())
    $("#edittingGroup").empty()
  $.ajax({
    type: "delete",
    url: '/groups/'+$(e).attr('id'),
    data: {authenticity_token:$('meta[name="csrf-token"]').attr("content")},
    success: function(result){
        $(e).closest('tr').remove()
    }
  });
}