require 'rails_helper'

describe Notifycation do
  message = "\n本日から5日間の範囲で、下記の時間帯にJRが遅延する恐れがあります\n2018-12-24 06:00:00\n"
  let(:notifycation) { Notifycation.new }

  before do
    FactoryBot.create(:threshold,wind_speed: 12.5)
  end

  describe '.create_message' do
    it 'is create message correct' do
      VCR.use_cassette("lib/get_five_day_weather") do
        expect(notifycation.create_message('ishinomaki')).to eq(message)
      end
    end
  end

end
