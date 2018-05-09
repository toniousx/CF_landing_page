require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:raw_courses_json) { JSON.parse(file_fixture('courses.json').read) }
  let(:raw_ui_json)      { JSON.parse(file_fixture('ui-course.json').read) }

  describe '.import_courses' do
    let(:courses_title) { Course.import_courses.map(&:title) }

    it 'add courses from the api' do
      expect(Course).to receive(:json_rest_courses).and_return(raw_courses_json) # rubocop:disable RSpec/MessageSpies
      expect(courses_title).to include('Become a Web Developer')
    end
  end

  describe '.import_course' do
    let(:course) { Course.import_course('become-a-ui-designer') }

    it 'fetches the course from the api and get the specific slug_course' do
      expect(Course).to receive(:json_rest_courses).and_return(raw_ui_json) # rubocop:disable RSpec/MessageSpies
    end
  end
end
