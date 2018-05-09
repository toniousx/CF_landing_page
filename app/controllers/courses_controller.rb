class CoursesController < ApplicationController
  before_action :set_courses

  def index; end

  def show
    @course = Course.import_course(params[:slug])
    @total_price = Course.import_course_price(params[:slug])
  end

  private

  def set_courses
    @courses = Course.import_courses
  end
end
