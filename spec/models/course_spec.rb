require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:raw_courses_json) { JSON.parse(file_fixture('courses.json').read) }

  describe '.import_courses' do
    let(:courses_title) { Course.import_courses.map(&:title) }

    it 'add courses from the api' do
      expect(Course).to receive(:json_rest_courses).and_return(raw_courses_json) # rubocop:disable RSpec/MessageSpies
      expect(courses_title).to include('Become a Web Developer')
    end
  end
end
