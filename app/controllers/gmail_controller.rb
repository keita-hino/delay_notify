class GmailController < ApplicationController
  protect_from_forgery :except => [:callback]
  def callback
    city_name = "ishinomaki"
    recorder = Recorder.new(city_name)
    recorder.insert_weather_log
  end
end
