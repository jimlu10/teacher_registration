require 'rails_helper'

RSpec.describe Registration, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:classroom).required }
    it { is_expected.to belong_to(:teacher).required }
  end
end
