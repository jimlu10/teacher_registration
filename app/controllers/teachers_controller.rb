class TeachersController < ApplicationController
  def index
    @teachers = TeacherBlueprint.render(Teacher.all, root: :teachers)

    render json: @teachers, status: :ok
  end
end
