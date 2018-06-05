class ImporterService < CourseService
  include ActiveModel::Model

  attr_accessor :title, :url, :slug, :author, :next_start, :next_start_formatted, :price, :start_dates

  def self.courses
    json_rest_courses['courses'].map do |key, values|
      ImporterService.new(values.merge(slug: key))
    end
  end

  def self.course(slug)
    ImporterService.new(json_rest_courses(slug))
  end
end
