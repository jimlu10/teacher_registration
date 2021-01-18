class Classroom < ApplicationRecord
  belongs_to :course, required: true
  belongs_to :teacher, optional: true
end
