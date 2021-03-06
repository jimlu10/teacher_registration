require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
  let(:teacher) { create(:teacher) }

  describe 'GET Index' do
    it 'Returns a 200' do
      teacher

      get :index

      expect(response).to have_http_status :ok
      expect(json_body).to include_json({
        teachers: [
          {
            id: teacher.id,
            name: teacher.name,
            lastname: teacher.lastname,
            email: teacher.email,
            votes: 0
          }
        ]
      })
    end
  end

  describe 'CREATE Teacher' do
    let :create_teacher_params do
      {
        teacher: {
          name: Faker::Name.name,
          lastname: Faker::Name.last_name,
          email: Faker::Internet.unique.email
        }
      }
    end

    context 'When successful' do
      it 'Creates a teacher' do
        post :create, params: create_teacher_params

        expect(response).to have_http_status :created
        expect(json_body).to include_json(
          name: create_teacher_params[:teacher][:name],
          lastname: create_teacher_params[:teacher][:lastname],
          email: create_teacher_params[:teacher][:email]
        )
      end
    end

    context 'When unsuccessful' do
      describe 'When Missing param' do
        it 'returns Missing name param' do
          create_teacher_params[:teacher].delete(:name)

          post :create, params: create_teacher_params

          expect(response).to have_http_status :unprocessable_entity
          expect(json_body).to include_json(errors: { name: ["can't be blank"] })
        end

        it 'returns Missing lastname param' do
          create_teacher_params[:teacher].delete(:lastname)

          post :create, params: create_teacher_params

          expect(response).to have_http_status :unprocessable_entity
          expect(json_body).to include_json(errors: { lastname: ["can't be blank"] })
        end

        it 'returns Missing email param' do
          create_teacher_params[:teacher].delete(:email)

          post :create, params: create_teacher_params

          expect(response).to have_http_status :unprocessable_entity
          expect(json_body).to include_json(errors: { email: ["can't be blank"] })
        end
      end

      describe 'When duplicated email' do
        it 'returns email has already been taken' do
          create_teacher_params[:teacher][:email] = teacher.email

          post :create, params: create_teacher_params

          expect(response).to have_http_status :unprocessable_entity
          expect(json_body).to include_json(errors: { email: ['has already been taken'] })
        end
      end
    end
  end

  describe 'PATCH like' do
    it 'Increments the counter on 1' do
      expect(teacher.votes).to eq(0)

      patch :like, params: { id: teacher.id }
      teacher.reload

      expect(response).to have_http_status :ok
      expect(json_body[:votes]).to eq(1)
    end
  end

  describe 'PATCH dislike' do
    it 'Decrements the counter on 1' do
      teacher.update(votes: 1)
      expect(teacher.votes).to eq(1)

      patch :dislike, params: { id: teacher.id }
      teacher.reload

      expect(response).to have_http_status :ok
      expect(json_body[:votes]).to eq(0)
    end
  end
end
