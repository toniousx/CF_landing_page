require 'rails_helper'

RSpec.describe ImporterService do
  let(:raw_courses_json) { JSON.parse(file_fixture('courses.json').read) }
  let(:raw_ui_json)      { JSON.parse(file_fixture('ui-course.json').read) }

  describe '.courses' do
    let(:courses_title) { described_class.courses.map(&:title) }

    VCR.use_cassette('json_rest_courses') do
      it 'fetches the CF Service and transforms them into models' do
        expect(described_class).to receive(:json_rest_courses).and_return(raw_courses_json) # rubocop:disable RSpec/MessageSpies
        expect(courses_title).to include('Become a Web Developer')
      end
    end
  end

  describe '.course(slug)' do
    let(:slug)            { 'become-a-ui-designer' }
    let(:course)          { described_class.course('become-a-ui-designer') }
    let(:total_usd_price) { course.price['NA']['total'] }

    VCR.use_cassette('json_rest_courses') do
      it 'fetches the course from the api and get the specific slug_course' do
        expect(described_class).to receive(:json_rest_courses).with(slug).and_return(raw_ui_json) # rubocop:disable RSpec/MessageSpies
        expect(total_usd_price).to include('$4999')
      end
    end
  end
end
