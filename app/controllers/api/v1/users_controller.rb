module Api
  module V1
    class UsersController < ApplicationController

      def create
        user = User.new(user_params)
        if user.save
          render json: user
        else
          render json: user.errors
        end
      end

      private
        def user_params
          params.require(:user).permit(:uuid, :name, :last_used_at)
        end
    end
  end
end
