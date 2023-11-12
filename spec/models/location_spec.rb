require 'rails_helper'

RSpec.describe Location, type: :model do
  context 'associations' do
    it { should have_many(:schedules) }
  end

  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:opened) }
    it { should validate_presence_of(:mask) }
    it { should validate_presence_of(:towel) }
    it { should validate_presence_of(:fountain) }
    it { should validate_presence_of(:locker_room) }
  end
end
