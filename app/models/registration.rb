class Registration < ApplicationRecord
  belongs_to :classroom, required: true
  belongs_to :teacher, required: true
end
