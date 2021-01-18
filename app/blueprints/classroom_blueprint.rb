class ClassroomBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    association :course, blueprint: CourseBlueprint
    association :teacher, blueprint: TeacherBlueprint, default: {}
    fields :votes
  end

  view :registration do
    field :course_name do |classroom, _|
      classroom.course.name
    end
  end
end
