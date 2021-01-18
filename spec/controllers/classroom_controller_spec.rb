require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do
  describe "POST Index" do
    let (:course) { create(:course) }
    let :create_classroom_params do
      {
        classroom: {
          course_id: course.id
        }
      }
    end

    context 'When successful' do
      it 'Creates a Classroom' do
        post :create, params: create_classroom_params

        expect(response).to have_http_status :created
        expect(json_body).to include_json(
          course: {
            id: course.id,
            name: course.name
          },
          teacher: {}
        )
      end
    end
  end
end
