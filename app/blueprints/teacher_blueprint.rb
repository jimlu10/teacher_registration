class TeacherBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :lastname, :votes, :email
end
