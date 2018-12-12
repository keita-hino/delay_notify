class GmailController < ApplicationController
  protect_from_forgery :except => [:callback]
  CITY_NAME = 'ishinomaki'
  def callback
    recorder = Recorder.new(CITY_NAME)
    recorder.insert_weather_log
  end

  def notify
    noti = Notifycation.new
    pid = fork do
      noti.line_notify(CITY_NAME)
    end

    # 子プロセスの終了ステータス情報解放
    Process.detach(pid)

    noti.slack_notify(CITY_NAME)
  end
end
