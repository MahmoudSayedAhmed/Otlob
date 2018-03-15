toInviteList = []
groupNames = []
groupsList = {}
if($("#groups").val())
{
  gtxts = $("#groups").val().split(' ')
  for (var i=0; i<gtxts.length; i++)
  {
    key = gtxts[i].split(':')[0];
    groupNames.push(key)
    value = gtxts[i].split(':')[1].split('*');
    value.splice(-1,1);
    groupsList[key]=value;
  }
}

function inviteFriend(name){
  if(name)
    fName = name
  else
    fName = $("#friend").val()
  if ($.inArray(fName, toInviteList) == -1)
  {
    $.ajax({
        method: 'post',
        url: '/set_friends',
        data: {name:fName, authenticity_token:$('meta[name="csrf-token"]').attr("content")},
        success: function(result){
          if (result.code == 0)
          {
            $("#invit").append("<div><img src='"+result.img+"' ><p>"+result.user.name+"</p><p id='"+result.user.name+"' onclick='removeInvitatoin(this)' class='removeLink'>remove</p></div>")
            toInviteList.push(result.user.name)
          }
          else if (result.code == 1)
            alert("he has to be your friend")
          else
            alert("not a user in system")
        }
    })
  }
  else
    alert(fName + " is already in invitaion list")
}

function inviteGroup(){
  gName = $("#group").val()
  if ($.inArray(gName, groupNames) != -1)
  {
    gMembers = groupsList[gName];
    for(var i=0; i<gMembers.length; i++)
      if ($.inArray(gMembers[i], toInviteList) == -1)
        inviteFriend(gMembers[i])
  }
  else
    alert("You don't have a group with this name")
}

function finish(e){
  $.ajax({
      method : 'post',
      url : '/orders/finish',
      data: {authenticity_token:$('meta[name="csrf-token"]').attr("content"), gid: $(e).attr('id')},
      success: function(result){
        $(e).parent().prev().text('Finished')
        $(e).next().remove()
        $(e).remove()
      }
  })

}

function destroy(e){
$.ajax({
    method: "delete",
    url: '/orders/'+$(e).prev().attr('id'),
    data: {authenticity_token:$('meta[name="csrf-token"]').attr("content")},
    success: function(result){
        $(e).closest('tr').remove()
    }
  });
}

function removeInvitatoin(e)
{
  name = $(e).attr('id')
  var index = $.inArray(name, toInviteList)
  if (index != -1){
    toInviteList.splice(index, 1);
    $(e).closest('div').remove()
  }
}

function invite()
{
  $.ajax({
      method : 'post',
      url : '/orders/invite',
      data: {authenticity_token:$('meta[name="csrf-token"]').attr("content"), list: toInviteList},
      success: function(result){
          toInviteList = []
        }
  })
}