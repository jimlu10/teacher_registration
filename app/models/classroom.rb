class Classroom < ApplicationRecord
  belongs_to :course, required: true
  belongs_to :teacher, optional: true
  has_many :teacher_registrations, class_name: 'Registration'
end
