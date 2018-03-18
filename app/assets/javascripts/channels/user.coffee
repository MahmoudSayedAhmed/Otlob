App.user = App.cable.subscriptions.create "UserChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if data.data.msgType
      $("#notify").prepend('<li class="notification-box">
                          <div class="row">
                            <div class="col-lg-6 col-sm-6 col-6 text-center">
                              <img src="'+data.data.img+'" class="w-50" style="float: left; margin-left: 10px;">
                            </div>    
                            <div class="col-lg-12 col-sm-12 col-12" style="color: black; margin-left: 10px;">'+data.data.msg+'</div>  
                            <button id="'+data.data.order_id+'" style="background-color: #4CAF50; color: white" onclick="joinOrder(this)">Join</button> 
                            <button style="background-color: #f44336; color: white" onclick="cancelOrder(this)">Cancel</button> </div>
                          <div role="separator" class="divider"></div>
                        </li>')
      alert "You have new invitaion.. Open notification bar to see it."
    else
      alert data.data.msg


