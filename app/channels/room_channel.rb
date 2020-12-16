class RoomChannel < ApplicationCable::Channel
  def subscribed
		stream_from "room_channel_#{params[:room_uuid]}"
	end

	def unsubscribed
		# Any cleanup needed when channel is unsubscribed
	end

  def send_message(data)
    room = Room.find(data["room_uuid"])
    message = UserRoomMessage.create!(user_id: current_user.id, room_id: room.id, message: data["message"])
	end
end