class UniversitiesController < ApplicationController

  def index
    universities = University.all
    render json: universities
  end
end
