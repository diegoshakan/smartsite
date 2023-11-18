require 'rails_helper'

RSpec.describe 'CreateSeed' do
  before do
    @location = FactoryBot.create(:location)
    FactoryBot.create(:schedule, hour: '07h às 12h', location: @location)

    @location2 = FactoryBot.create(:location)
    FactoryBot.create(:schedule, hour: '13h às 18h', location: @location2)

    @params = {
      hour: '06:00 às 12:00',
      opened: '1'
    }

    @params2 = {
      hour: '12:01 às 15:00',
      opened: '1'
    }
  end

  context 'call' do
    it 'example 1' do
      results = LocationsServices::Search.new(@params).call
      expect(results.include?(@location)).to be_truthy
    end

    it 'example 2' do
      results = LocationsServices::Search.new(@params2).call
      expect(results.include?(@location2)).to be_truthy
    end
  end
end
