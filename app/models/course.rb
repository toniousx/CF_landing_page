class Course
  include ActiveModel::Model

  attr_accessor :title, :url, :slug, :author, :next_start, :next_start_formatted, :price, :start_dates

  def self.import_courses
    json_rest_courses['courses'].map do |key, values|
      Course.new(values.merge(slug: key))
    end
  end

  def self.import_course(slug)
    Course.new(json_rest_courses(slug))
  end

  def self.import_course_price(slug)
    Course.import_course(slug).price['NA']['total']
  end

  private_class_method def self.json_rest_courses(course = nil)
    url = "https://careerfoundry.com/en/api/courses/#{course}"
    Rails.cache.fetch(url, expires_in: 1.hour) do
      JSON.parse(OpenURI::OpenRead.open(url).read)
    end
  end
end
