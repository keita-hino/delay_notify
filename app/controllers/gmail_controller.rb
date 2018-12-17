class GmailController < ApplicationController
  protect_from_forgery :except => [:callback]
  CITY_NAME = 'ishinomaki'
  def callback
    recorder = Recorder.new(CITY_NAME)
    recorder.insert_weather_log
    head 200
  end

  def notify
    noti = Notifycation.new
    noti.line_notify(CITY_NAME)
    noti.slack_notify(CITY_NAME)
    head 200
  end
end
