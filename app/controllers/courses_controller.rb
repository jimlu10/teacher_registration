class CoursesController < ApplicationController
  def create
    @course = Course.new(course_params)

    if @course.save
      render json: CourseBlueprint.render(@course), status: :created
    else
      render json: { errors: @course.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:name)
  end
end
