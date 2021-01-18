require 'rails_helper'

RSpec.describe Classroom, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:course).required }
    it { is_expected.to belong_to(:teacher).optional }
  end
end
