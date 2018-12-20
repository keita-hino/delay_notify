require 'rails_helper'

RSpec.describe Weather, type: :model do
  before do
    FactoryBot.create(:weather,wind_speed:1)
    FactoryBot.create(:weather,wind_speed:3)
  end
  describe '#wind_speed_average' do
    it 'is average value correct' do
      expect(Weather.wind_speed_average("ishinomaki")).to eq(2)
    end
  end
end
