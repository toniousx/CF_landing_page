class CoursesController < ApplicationController
  before_action :set_courses

  def index; end

  def show
    @course = ImporterService.course(params[:slug])
  end

  private

  def set_courses
    @courses = ImporterService.courses
  end
end
