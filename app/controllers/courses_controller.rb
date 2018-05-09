class CoursesController < ApplicationController
  def index
    @courses = Course.new
  end
end
