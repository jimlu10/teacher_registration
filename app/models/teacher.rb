class Teacher < ApplicationRecord
  validates :email, uniqueness: true
end
