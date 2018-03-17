GroupsNames=[]

if($("#usergps").val())
{
  gtxts = $("#usergps").val().split('*')
  gtxts.splice(-1,1)
  for (var i=0; i<gtxts.length; i++)
  {
       GroupsNames.push(gtxts[i])
  }

}
  console.log(GroupsNames)
function addGroup(){
  gName = $("#group").val()
  if ($.inArray(gName,GroupsNames) == -1)
  {
    $.ajax({
        method: 'post',
        url: '/groups',
        data: {name:gName, authenticity_token:$('meta[name="csrf-token"]').attr("content")},
        success: function(result){if ($('#groupContainer').children().length!=0)
            $("#groupsList").append('<tr><td>'+result["str"]+'<td><i class="fa fa-user-plus" style="font-size:36px;color:blue" onclick="editGroup(this)"></i></td><td><i id="'+result["id"]+'" class="fa fa-remove" style="font-size:36px;color:red" onclick="deleteGroup(this)"></i></td>')
          else
            buildPage(result["str"],result["id"]);
        }

    })
    GroupsNames.push(gName)
  }
  else {
    alert("already exist")
  }
}








function addFriendToGroup(){
  fname = $("#friend").val()
    $.ajax({
        method: 'post',
        url: '/friendships_groups',
        data: {friendName:fname, group_id:$('#edittingGroup').attr('gid'), authenticity_token:$('meta[name="csrf-token"]').attr("content")},
        dataType: "json",
        success: function(result){$("#friendList").append('<div><img src="'+result["ImgSrc"]+'" ><p>'+result["str"]+'</p><p id="'+result["fid"]+'" onclick="removeFriendFromGroup(this)" class="removeLink">remove</p></div>')},
         error: function (result) {
           alert("wrong entry")}

    })
}


function removeFriendFromGroup(e){
  $.ajax({
    type: "delete",
    url: '/friendships_groups/'+$(e).attr('id'),
    data: {authenticity_token:$('meta[name="csrf-token"]').attr("content"), gid: $("#edittingGroup").attr('gid')},
    success: function(result){
        $(e).closest('div').remove()
    }
  });
}


function editGroup(e){
  var ID = $(e).parent().next().children().attr('id')
  var gName = $(e).parent().prev().text()
  if (gName!=$("#gname").text())
  {
    $('#edittingGroup').empty();
    $('#edittingGroup').attr('gid', ID);
    $('#edittingGroup').append('<h3 id="gname">'+gName+'</h3><p>your friend name</p><input id="friend"><button onclick="addFriendToGroup()">add</button><div id="friendList"></div>');
    $.ajax({
      url: '/groups/'+ID,
      data: {authenticity_token:$('meta[name="csrf-token"]').attr("content")},
      success: function(result){
        $("#friendList").empty()
        for (var i=0; i<result["list"].length; i++)
          $("#friendList").append('<div><img src="'+result["ImgList"][i]+'" ><p>'+result["list"][i]+'</p><p id="'+result["fids"][i]+'" onclick="removeFriendFromGroup(this)" class="removeLink">remove</p></div>')
      }
    });
    }
}


function deleteGroup(e){
  var gName = $(e).parent().prev().prev().text()
  if(gName == $("#gname").text())
    $("#edittingGroup").empty()
    var index = GroupsNames.indexOf(gName);
    GroupsNames.splice(index,1)
  $.ajax({
    type: "delete",
    url: '/groups/'+$(e).attr('id'),
    data: {authenticity_token:$('meta[name="csrf-token"]').attr("content")},
    success: function(result){
        $(e).closest('tr').remove()
    }
  });
}

function buildPage(name,id){
  $('#groupContainer').append('<h3>My Groups</h3><table><thead><tr><th>Name</th><th colspan="3"></th></tr></thead><tbody id="groupsList"><tr><td>'+name+'</td><td><i class="fa fa-user-plus" style="font-size:36px;color:blue" onclick="editGroup(this)"></i></td><td><i id="'+id+'" class="fa fa-remove" style="font-size:36px;color:red" onclick="deleteGroup(this)"></i></td></tr></tbody></table></br><div id="edittingGroup" gid="'+id+'"><h3 id="gname">'+name+'</h3><p>your friend name</p><input class="field" id="friend"><button class="actions" onclick="addFriendToGroup()">add</button><div id="friendList"></div></div>');
}
