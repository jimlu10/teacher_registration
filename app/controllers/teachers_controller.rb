class TeachersController < ApplicationController
  def index
    @teachers = TeacherBlueprint.render(Teacher.all, root: :teachers)

    render json: @teachers, status: :ok
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      render json: TeacherBlueprint.render(@teacher), status: :created
    else
      render json: { errors: @teacher.errors.messages }, status: :unprocessable_entity
    end
  end

  def like
    @teacher = Teacher.find_by(id: params[:id])
    @teacher.with_lock do
      @teacher.increment!(:votes, 1)
    end

    render json: TeacherBlueprint.render(@teacher), status: :ok
  end

  def dislike
    @teacher = Teacher.find_by(id: params[:id])
    @teacher.with_lock do
      @teacher.decrement!(:votes, 1)
    end

    render json: TeacherBlueprint.render(@teacher), status: :ok
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :lastname, :email)
  end
end
