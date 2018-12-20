require 'rails_helper'

describe Request do
  let(:url) { "http://api.openweathermap.org/data/2.5/find?q=ishinomaki,jp&units=metric&APPID=#{ENV['OPEN_WEATHER_APIKEY']}" }
  let(:request) { Request.new(url) }
  
  describe '#GET' do
    it 'is get api result correct' do
      VCR.use_cassette("lib/request/get_five_day_weather") do
        expect(request.get["cod"]).to eq("200")
      end
    end
  end

end
