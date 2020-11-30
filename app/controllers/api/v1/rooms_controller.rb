module Api
  module V1
    class RoomsController < ApplicationController
      def show
        room = Room.includes(:user_room_messages).find_by(uuid: params[:uuid])
        render json: { room: room }, include: [:user_room_messages]
      end
    end
  end
end
