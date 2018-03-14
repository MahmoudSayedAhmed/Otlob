function addFriend(){
  Email = $("#addfriend").val()
    $.ajax({
        method: 'post',
        url: '/addfriends',
        data: {email:Email, authenticity_token:$('meta[name="csrf-token"]').attr("content")},
        success: function(result){
          if (result.code == 1)
             {$("#friendsList").append('<div><img src="'+result.img+'"><p>'+result.user.name+'</p><p id="'+result.user.id+'" onclick="removeFriend(this)" class="removeLink">unfriend</p></div>')}
          else if (result.code == 2)
            {alert("it's not a user in system")}
        }
    })
}

function unfriend(e){
  $.ajax({
    type: "post",
    url: '/unfriend',
    data: {authenticity_token:$('meta[name="csrf-token"]').attr("content"), fid: $(e).attr('id')},
    success: function(result){
        $(e).closest('div').remove()
    }
  });
}
