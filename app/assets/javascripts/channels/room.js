(function() {
    App.room = App.cable.subscriptions.create("RoomChannel", {
        collection: function() {
            return $("[data-channel='messages']");
        },
        connected: function() {
            return setTimeout((function(_this) {
                return function() {
                    var roomId;
                    roomId = _this.collection().data('channel-id');
                    // debugger;
                    return _this.perform('follow', {
                        room_id: roomId
                    });
                };
            })(this), 1000);
        },
        disconnected: function() {},
        received: function(data) {
            // debugger;
            return this.collection().append('<li>' + data.comment + '</li>');
        },
        speak: function(comment) {
            // debugger;
            return this.perform('speak', comment);
        }
    });

}).call(this);