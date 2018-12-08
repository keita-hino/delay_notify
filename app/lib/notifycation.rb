class Notifycation

  def line_notify(city_name)
    request = Request.new(line_endpoint)
    authorization = "Bearer #{line_accsess_key}"
    request.post(authorization,message(city_name))
  end

  def message(city_name)
    message = []
    message << "\n本日、下記の時間帯にJRが遅延する恐れがあります"
    recorder = Recorder.new(city_name)
    eva_wind = recorder.wind_speed_average

    recorder.weather_today.each do |list|
      if eva_wind <= list['wind']['speed'] then
        message.push(list['dt_txt'] + "\n")
      end
    end
    return message.join
  end

  def line_accsess_key
    line_accsess_key = ENV['LINE_NOTIFY_KEY']
  end

  def line_endpoint
    url = "https://notify-api.line.me/api/notify"
  end

end
