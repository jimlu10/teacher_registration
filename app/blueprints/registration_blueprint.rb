class RegistrationBlueprint < Blueprinter::Base
  identifier :id

  association :classroom, blueprint: ClassroomBlueprint, view: :registration
  association :teacher, blueprint: TeacherBlueprint
end
