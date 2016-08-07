App.room = App.cable.subscriptions.create {channel: "RoomChannel", room: $("#channel_id").val()},
  connected:->
# Called when the subscription is ready for use on the server

  disconnected: ->
# Called when the subscription has been terminated by the server

  received: (data) ->
# Called when there's incoming data on the websocket for this channel
   debugger
   $(".message").eq(0).before(data['message'])

  speak: (room, message, user_name)->
    @perform 'speak',room: room, message: message, user_name: user_name

  readCookie: (name) ->
    nameEQ = name + "="
    ca = document.cookie.split(";")
    i = 0
    while i < ca.length
      c = ca[i]
      c = c.substring(1, c.length)  while c.charAt(0) is " "
      return c.substring(nameEQ.length, c.length).replace(/"/g, '')  if c.indexOf(nameEQ) is 0
      i++
    ca
  channel: ->
    channel = $("#channel_id").val()
    channel

  $(document).on 'click', '[data-behavior~=room-speaker]', () ->
    message = $("#message")
    channel = $("#channel_id").val()
    author = App.room.readCookie "chat_user_name"
    App.room.speak channel, message.val(), author
    message.val("")
    ""


