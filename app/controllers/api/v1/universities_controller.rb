module Api
  module V1
    class UniversitiesController < ApplicationController

      def index
        universities = University.all
        render json: { universities: universities }
      end
    end
  end
end
