module CoursesHelper
  def next_start_date
    @course.start_dates.first
  end

  def current_course_title
    @courses.each { |course| return course.title if course.slug == @course.slug }
  end
end
