require 'rails_helper'

RSpec.describe Teacher, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:lastname) }

    it { is_expected.to validate_presence_of(:email) }

    it do
      create(:teacher)
      is_expected.to validate_uniqueness_of(:email).case_insensitive
    end
  end
end
