function submitNewMessage() {
    $('#message_body').keyup(function(e){
        if(e.keyCode == 13) {
            $('#new_message').submit();
        }
    });
}

function messages_to_bottom() {
    $('#messages').scrollTop($('#messages').prop("scrollHeight"));
}

jQuery(document).on('ready', function() {
    submitNewMessage();
    messages_to_bottom();

    if ($('#messages').length > 0) {
        messages_to_bottom();
    }

    if((!App.global_chat || App.global_chat.consumer.connection.disconnected) && $('#messages').length > 0) {
        App.global_chat = App.cable.subscriptions.create({
            channel: "ChatRoomsChannel",
            chat_room_id: $('#messages').data('chat-room-id')
        }, {
            connected: function() {},
            disconnected: function() {},
            received: function(data) {
                $('#messages').append(data['message']);
                return messages_to_bottom();
            },
            send_message: function(message, chat_room_id) {
                return this.perform('send_message', {
                    message: message,
                    chat_room_id: chat_room_id
                });
            }
        });
    }

    $('#new_message').submit(function(e) {
        var $this, textarea;
        $this = $(this);
        textarea = $this.find('#message_body');
        if ($.trim(textarea.val()).length > 1) {
            App.global_chat.send_message(textarea.val(), $('#messages').data('chat-room-id'));
            textarea.val('');
        }
        e.preventDefault();
        return false;
    });

    if((!App.appearances || App.appearances.consumer.connection.disconnected) && $('#messages').length > 0) {
        App.appearances = App.cable.subscriptions.create({
                channel: "AppearancesChannel",
                chat_room_id: $('#messages').data('chat-room-id')
            }, {
                connected: function() {},
                // Called when the subscription is ready for use on the server

                disconnected: function() {},
                // Called when the subscription has been terminated by the server

                received: function(data) {
                    // Called when there's incoming data on the websocket for this channel
                    return $('#active_users').html(data);
                }
            }
        );
    }
});
