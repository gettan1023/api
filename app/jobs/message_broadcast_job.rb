class MessageBroadcastJob < ApplicationJob
  def perform(user_room_message)
    ActionCable.server.broadcast("room_channel_#{user_room_message.room.uuid}", message: user_room_message.message, user_uuid: user_room_message.user.uuid, send_at: user_room_message.send_at)
  end
end