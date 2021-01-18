require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do
  let (:course) { create(:course) }
  let (:teacher) { create(:teacher) }
  let (:classroom) { create(:classroom, teacher: teacher, course: course) }
  let (:registration) { create(:registration, classroom: classroom, teacher: teacher) }

  describe 'POST Create' do
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
          teacher: {},
          votes: 0
        )
      end
    end
  end

  describe 'POST Registration' do
    let(:create_registration_params) do
      {
        classroom_id: classroom.id,
        teacher_id: teacher.id
      }
    end

    it 'Creates a Classroom' do
      post :registration, params: create_registration_params

      expect(response).to have_http_status :created
      expect(json_body).to include_json(
        classroom: {
          id: create_registration_params[:classroom_id],
          course_name: course.name
        },
        teacher: {
          id: teacher.id,
          name: teacher.name,
          lastname: teacher.lastname
        }
      )
    end

    describe 'POST Assign' do
      let(:assign_teacher_params) do
        {
          classroom_id: classroom.id,
          registration_id: registration.id
        }
      end

      it 'Assigns teacher to classroom' do
        patch :assign, params: assign_teacher_params

        expect(response).to have_http_status :created
        expect(json_body).to include_json(
          course: {
            id: course.id,
            name: course.name
          },
          teacher: {
            id: teacher.id,
            name: teacher.name,
            lastname: teacher.lastname
          }
        )
      end
    end
  end

  describe 'PATCH like' do
    it 'Increments the counter on 1' do
      expect(classroom.votes).to eq(0)

      patch :like, params: { classroom_id: classroom.id }
      classroom.reload

      expect(response).to have_http_status :ok
      expect(json_body[:votes]).to eq(1)
    end
  end

  describe 'PATCH dislike' do
    it 'Decrements the counter on 1' do
      classroom.update(votes: 1)
      expect(classroom.votes).to eq(1)

      patch :dislike, params: { classroom_id: classroom.id }
      classroom.reload

      expect(response).to have_http_status :ok
      expect(json_body[:votes]).to eq(0)
    end
  end
end
