class Notifycation

  def line_notify(city_name)
    request = Request.new(line_endpoint)
    authorization = "Bearer #{line_accsess_key}"
    if message = create_message(city_name)
      request.post(message,authorization)
    end
  end

  def slack_notify(city_name)
    request = Request.new(slack_endpoint)
    if message = create_message(city_name)
      param = {
                token:ENV['SLACK_BOT_OAUTH'],
                channel: "#train-info",
                text: message,
                as_user: true,
              }
      request.slack_post(param)
    end
  end

  def create_message(city_name)
    message  = "\n本日から5日間の範囲で、下記の時間帯にJRが遅延する恐れがあります\n"
    recorder = Recorder.new(city_name)
    eva_wind = Threshold.threshold_latest(city_name)
    count = 0

    recorder.five_day_weather.each do |list|
      if eva_wind <= list['wind']['speed'] then
        message << list['dt_txt'] + "\n"
        count += 1
      end
    end
    message = nil if count == 0
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
