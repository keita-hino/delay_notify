class GmailController < ApplicationController
  protect_from_forgery :except => [:callback]
  CITY_NAME = 'ishinomaki'
  def callback
    recorder = Recorder.new(CITY_NAME)
    recorder.insert_weather_log
  end

  def notify
    recorder = Recorder.new(CITY_NAME)
    recorder.today_weather
  end
end
