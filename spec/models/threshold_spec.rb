require 'rails_helper'

RSpec.describe Threshold, type: :model do
  before do
    FactoryBot.create(:weather,wind_speed:3)
    FactoryBot.create(:weather,wind_speed:5)
    FactoryBot.create(:threshold)
  end
  describe '#threshold_latest' do
    it 'is threshold value correct' do
      expect(Threshold.threshold_latest('ishinomaki')).to eq(16)
    end
  end
  describe '#threshold_update' do
    it 'is threshold update result correct' do
      Threshold.threshold_update("ishinomaki")
      expect(Threshold.where(city_name:'ishinomaki')
                      .pluck(:wind_speed)
                      .last).to eq(4)
    end
  end
end
