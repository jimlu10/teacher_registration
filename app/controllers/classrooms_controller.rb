class ClassroomsController < ApplicationController
  def create
    @classroom = Classroom.new(classroom_params)

    if @classroom.save
      render json: ClassroomBlueprint.render(@classroom, view: :normal), status: :created
    else
      render json: { errors: @classroom.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def classroom_params
    params.require(:classroom).permit(:course_id)
  end
end
