class Recorder
  attr_accessor :city_name
  root_json = {}
  def initialize(city_name)
    @city_name = city_name
  end

  define_method :insert_weather_log do
    url = "http://api.openweathermap.org/data/2.5/find?q=#{city_name},jp&units=metric&APPID=#{ENV['OPEN_WEATHER_APIKEY']}"
    request = Request.new(url)

    # #ルート設定
    root_json = request.get["list"][0]

      weather = Weather.new(
        city_name:  city_name,
        rain:       rain_check,
        snow:       snow_check,
        wind_deg:   wind_deg,
        wind_speed: wind_speed
      )

      weather.save
  end

  define_method :wind_speed do
    root_json["wind"]["speed"]
  end

  define_method :wind_deg do
    get_direction(root_json["wind"]["deg"])
  end

  define_method :rain_check do
    get_stat(root_json["rain"])
  end

  define_method :snow_check do
    get_stat(root_json["snow"])
  end

  def get_direction(direction_no)
    case direction_no
      when 0..39 then wind_deg = "北"
      when 40..89 then wind_deg = "北東"
      when 90..139 then wind_deg = "東"
      when 140..179 then wind_deg = "南東"
      when 180..219 then wind_deg = "南"
      when 220..269 then wind_deg = "南西"
      when 270..309 then wind_deg = "西"
      when 310..360 then wind_deg = "北西"
    end
  end

  def get_stat(check_target)
    if check_target.nil?
      return true
    else
      return false
    end
  end

  def get_today_weather(eva_wind)
    delay_date = []
    weather_hash = {}
    count = 0
    url = "http://api.openweathermap.org/data/2.5/forecast?q=#{city_name},jp&units=metric&APPID=#{ENV['OPEN_WEATHER_APIKEY']}"
    request = Request.new(url)

    json = request.get['list']
    json[0].each do |list|
      if eva_wind <= json[count]['wind']['speed'] then
        delay_date.push(json[count]['dt_txt'].gsub(" ","."))
      end
      count = count + 1
    end

    noti = Notifycation.new
    noti.line_notify(delay_date)
  end

end
