class TeacherBlueprint < Blueprinter::Base
  identifier :id

  fields :name
  association :teacher, blueprint: TeacherBlueprint, default: {}
end
