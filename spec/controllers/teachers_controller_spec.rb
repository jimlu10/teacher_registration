require 'rails_helper'

RSpec.describe TeachersController, type: :controller do
  describe "GET Index" do
    it 'Returns a 200' do
      teacher = create(:teacher)

      get :index

      expect(response).to have_http_status :ok
      expect(json_body).to include_json({
        teachers: [
          {
            id: teacher.id,
            name: teacher.name,
            lastname: teacher.lastname,
            email: teacher.email
          }
        ]
      })
    end
  end
end
