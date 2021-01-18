require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it do
      create(:course)
      is_expected.to validate_uniqueness_of(:name).case_insensitive
    end
  end




end
