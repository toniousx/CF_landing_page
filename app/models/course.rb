require 'open-uri' # we need to requiree it in order to avoid conflicts with Kernel#open  *see line 17

class Course
  include ActiveModel::Model

  attr_accessor :title, :url, :slug, :author, :next_start, :next_start_formatted, :price, :start_dates

  def self.import_courses
    json_rest_courses['courses'].map do |key, values|
      Course.new(values.merge(slug: key))
    end
  end

  private_class_method def self.json_rest_courses
    url = 'https://careerfoundry.com/en/api/courses/'
    JSON.parse(open(url).read) # rubocop:disable Security/Open
  end
end
