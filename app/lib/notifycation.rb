class Notifycation

  def line_notify(city_name)
    recorder = Recorder.new(city_name)
    @delay_date = recorder.threshold_over_list
    request = Request.new(line_endpoint)
    authorization = "Bearer #{line_accsess_key}"
    request.post(authorization,message)
  end

  def line_accsess_key
    line_accsess_key = ENV['LINE_NOTIFY_KEY']
  end

  def message
    buf = []
    buf << "\n本日、下記の時間帯にJRが遅延する恐れがあります"
    @delay_date.each do |msg|
      buf << msg + "\n"
    end
    buf.join
  end

  def line_endpoint
    url = "https://notify-api.line.me/api/notify"
  end

end
