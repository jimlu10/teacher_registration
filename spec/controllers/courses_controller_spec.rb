require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe 'GET Index' do
    it 'Returns a 200' do
      course = create(:course)

      get :index

      expect(response).to have_http_status :ok
      expect(json_body).to include_json({
        courses: [
          {
            id: course.id,
            name: course.name
          }
        ]
      })
    end
  end

  describe "POST Index" do
    let :create_course_params do
      {
        course: {
          name: Faker::Job.unique.title
        }
      }
    end

    context 'When successful' do
      it 'Creates a course' do
        post :create, params: create_course_params

        expect(response).to have_http_status :created
        expect(json_body).to include_json(name: create_course_params[:course][:name])
      end
    end

    context 'When unsuccessful' do
      context 'When missing param' do
        it 'Creates a course' do
          create_course_params[:course][:name] = ''

          post :create, params: create_course_params

          expect(response).to have_http_status :unprocessable_entity
          expect(json_body).to include_json(errors: { name: ["can't be blank"] })
        end
      end

      describe 'When duplicated name' do
        it 'returns email has already been taken' do
          course = create(:course)
          create_course_params[:course][:name] = course.name

          post :create, params: create_course_params

          expect(response).to have_http_status :unprocessable_entity
          expect(json_body).to include_json(errors: { name: ['has already been taken'] })
        end
      end
    end
  end
end
