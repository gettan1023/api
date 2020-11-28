module Api
  module V1
    class UsersController < ApplicationController

      def create
        user = User.new(user_params)
        if user.save
          render json: {user: user}
        else
          render json: {user: user.errors}
        end
      end

      private
        def user_params
          params.require(:user).permit(:name, :last_used_at)
        end
    end
  end
end
