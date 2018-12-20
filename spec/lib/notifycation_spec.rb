require 'rails_helper'

describe Notifycation do
  message = "\n本日から5日間の範囲で、下記の時間帯にJRが遅延する恐れがあります\n2018-12-24 06:00:00\n"

  before do
    FactoryBot.create(:threshold,wind_speed: 12.5)
    @noti = Notifycation.new
  end

  it 'is create message correct' do
    VCR.use_cassette("lib/get_five_day_weather") do
      expect(@noti.create_message('ishinomaki')).to eq(message)
    end
  end

end
