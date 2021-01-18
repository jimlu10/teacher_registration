class ClassroomsController < ApplicationController
  def create
    @classroom = Classroom.new(classroom_params)

    if @classroom.save
      render json: ClassroomBlueprint.render(@classroom, view: :normal), status: :created
    else
      render json: { errors: @classroom.errors.messages }, status: :unprocessable_entity
    end
  end

  def registration
    @registration = Registration.new(registration_params)

    if @registration.save
      render json: RegistrationBlueprint.render(@registration), status: :created
    else
      render json: { errors: @registration.errors.messages }, status: :unprocessable_entity
    end
  end

  def assign
    @classroom = Classroom.find_by(id: assign_params[:classroom_id])
    registration = @classroom.teacher_registrations.find_by(id: assign_params[:registration_id])
    @classroom.assign_attributes(teacher: registration.teacher)

    if @classroom.valid?
      @classroom.save
      render json: ClassroomBlueprint.render(@classroom, view: :normal), status: :created
    else
      render json: { errors: @classroom.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def classroom_params
    params.require(:classroom).permit(:course_id)
  end

  def registration_params
    params.permit(:classroom_id, :teacher_id)
  end

  def assign_params
    params.permit(:classroom_id, :registration_id)
  end
end
