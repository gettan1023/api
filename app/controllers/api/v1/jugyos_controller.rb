module Api
  module V1
    class JugyosController < ApplicationController

      def create
        jugyo = Jugyo.new(jugyo_params)
        if jugyo.save
          render json: {jugyo: jugyo}
        else
          render json: {jugyo: jugyo.errors}
        end
      end

      private

        def jugyo_params
          params.require(:jugyo).permit(:university_id, :name, :day, :period, :teacher_name, :date, :closing_date, :admin_user_id)
        end
    end
  end
end
