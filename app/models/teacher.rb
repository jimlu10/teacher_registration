class Teacher < ApplicationRecord
  validates :name, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
end
