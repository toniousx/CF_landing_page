class CoursesController < ApplicationController
  before_action :set_courses

  def index; end

  def show
    @course = CourseService.import_course(params[:slug])
  end

  private

  def set_courses
    @courses = CourseService.import_courses
  end
end
