function addFriend(){
  Email = $("#addfriend").val()
    $.ajax({
        method: 'post',
        url: '/addfriends',
        data: {email:Email, authenticity_token:$('meta[name="csrf-token"]').attr("content")},
        success: function(result){


          if (result.code == 1)
             {$("#friendList").append("<p>"+result.user.name  +" </p>")}
          else if (result.code == 2)
            {alert("it's not a user in system")}



        }

    })
}
