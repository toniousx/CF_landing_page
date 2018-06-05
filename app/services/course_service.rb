require 'open-uri' # we need to requiree it in order to avoid conflicts with Kernel#open  *see line 17

class CourseService
  private_class_method def self.json_rest_courses(course = nil)
    url = "https://careerfoundry.com/en/api/courses/#{course}"
    Rails.cache.fetch(url, expires_in: 1.hour) do
      JSON.parse(open(url).read) # rubocop:disable Security/Open
    end
  end
end
