class Notifycation

  def line_notify(city_name)
    request = Request.new(line_endpoint)
    authorization = "Bearer #{line_accsess_key}"
    request.post(message(city_name),authorization)
  end

  def slack_notify(city_name)
    request = Request.new(slack_endpoint)
    param = {
              token:ENV['SLACK_BOT_OAUTH'],
              channel: "#train-info",
              text: message(city_name),
              as_user: true,
            }
    request.slack_post(param)
  end

  def message(city_name)
    message  = "\n本日、下記の時間帯にJRが遅延する恐れがあります\n"
    recorder = Recorder.new(city_name)
    eva_wind = Threshold.threshold_latest(city_name)

    recorder.weather_today.each do |list|
      if eva_wind <= list['wind']['speed'] then
        message << list['dt_txt'] + "\n"
      end
    end
    return message
  end

  def line_accsess_key
    ENV['LINE_NOTIFY_KEY']
  end

  def line_endpoint
    "https://notify-api.line.me/api/notify"
  end

  def slack_endpoint
    "https://slack.com/api/chat.postMessage"
  end

end
