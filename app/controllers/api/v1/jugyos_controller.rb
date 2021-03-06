module Api
  module V1
    class JugyosController < ApplicationController

      def index
        jugyos = Jugyo.includes(:rooms).where(is_closed: false)
        if jugyos.empty?
          render json: {}
        else
          render json: { jugyos: jugyos }, include: [:rooms]
        end
      end

      def create
        jugyo = Jugyo.new(jugyo_params)
        if jugyo.save
          room = Room.create(jugyo_id: jugyo.id, is_main_room: true)
          render json: { jugyo: jugyo, room: room }
        else
          render json: { jugyo: jugyo.errors }
        end
      end

      private

        def jugyo_params
          params.require(:jugyo).permit(:university_id, :name, :day, :period, :teacher_name, :date, :closing_date, :admin_user_id)
        end
    end
  end
end
