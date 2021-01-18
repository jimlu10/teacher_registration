class ClassroomBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    association :course, blueprint: CourseBlueprint
    association :teacher, blueprint: TeacherBlueprint, default: {}
  end
end
