require 'rails_helper'

RSpec.describe Location, type: :model do
  context 'associations' do
    it { should have_many(:schedules) }
  end

  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end
end
