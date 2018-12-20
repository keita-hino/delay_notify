require 'rails_helper'

describe Notifycation do
  message = "\n本日から5日間の範囲で、下記の時間帯にJRが遅延する恐れがあります\n2018-12-24 06:00:00\n"
  let(:notifycation) { Notifycation.new }

  before do
    FactoryBot.create(:threshold,wind_speed: 12.5)
  end

  describe '.create_message' do
    it 'is create message correct' do
      VCR.use_cassette("lib/notifycation/get_five_day_weather") do
        expect(notifycation.create_message('ishinomaki')).to eq(message)
      end
    end
  end

  describe '.line_notify' do
    it 'is notify on line correct' do
      VCR.use_cassette("lib/notifycation/post_line_notify") do
        expect(notifycation.line_notify('ishinomaki').code).to eq("200")
      end
    end
  end

  describe '.slack_notify' do
    it 'is notify on slack correct' do
      VCR.use_cassette("lib/notifycation/post_slack_notify") do
        expect(notifycation.slack_notify('ishinomaki').code).to eq(200)
      end
    end
  end

end
