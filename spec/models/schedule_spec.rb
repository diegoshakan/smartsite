require 'rails_helper'

RSpec.describe Schedule, type: :model do
  context 'associations' do
    it { should belong_to(:location) }
  end

  context 'validations' do
    it { should validate_presence_of(:week_days) }
    it { should validate_presence_of(:hour) }
  end
end
