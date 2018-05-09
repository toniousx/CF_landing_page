class CoursesController < ApplicationController
  def index
    @courses = Course.import_courses
  end
end
