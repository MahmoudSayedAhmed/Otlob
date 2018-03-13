function inviteFriend(){
  fName = $("#friend").val()
  console.log(fName)
    $.ajax({
        method: 'post',
        url: '/set_friends',
        data: {name:fName, authenticity_token:$('meta[name="csrf-token"]').attr("content")},
        success: function(result){
  



          if (result.code == 0)
             {$("#invited Friend").append("<p>"+result.user.name  +" </p>")}
          else if (result.code == 1)
            {alert("he has to be your friend")}
          else
            {alert("not a user in system")}




        }
    })
}
