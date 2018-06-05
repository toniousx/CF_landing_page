require 'rails_helper'

RSpec.describe CourseService do
  let(:raw_courses_json) { JSON.parse(file_fixture('courses.json').read) }
  let(:raw_ui_json)      { JSON.parse(file_fixture('ui-course.json').read) }

  describe '.import_courses' do
    VCR.use_cassette('json_rest_courses') do
      it 'fetches the CF Service and transforms them into models' do
        expect(described_class.send(:json_rest_courses)).to eql(raw_courses_json)
      end
    end
  end

  describe '.import_course(slug)' do
    let(:slug) { 'become-a-ui-designer' }

    VCR.use_cassette('json_rest_courses') do
      it 'fetches the course from the api and get the specific slug_course' do
        expect(described_class.send(:json_rest_courses, slug)).to eql(raw_ui_json)
      end
    end
  end
end
