require 'rails_helper'

RSpec.describe Classroom, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:course).required }
    it { is_expected.to belong_to(:teacher).optional }
    it { is_expected.to have_many(:teacher_registrations).class_name('Registration') }
  end
end
