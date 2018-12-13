class Recorder
  attr_accessor :city_name
  root_json = {}
  def initialize(city_name)
    @city_name = city_name
  end

  define_method :insert_weather_log do
    url = "http://api.openweathermap.org/data/2.5/find?q=#{city_name},jp&units=metric&APPID=#{open_weather_key}"
    request = Request.new(url)

    # #ルート設定
    root_json = request.get["list"][0]
    puts "●#{request.get["list"][0]}"
    Weather.create(
      city_name:  city_name,
      rain:       rain_check,
      snow:       snow_check,
      wind_deg:   wind_deg,
      wind_speed: wind_speed
    )
    # 閾値を変更
    threshold_modify

  end

  def threshold_modify
    wind_speed = Weather.wind_speed_average(city_name,wind_speed)
    Threshold.create(
      wind_speed:wind_speed,
      city_name:city_name
    )
  end

  def open_weather_key
    ENV['OPEN_WEATHER_APIKEY']
  end

  define_method :wind_speed do
    root_json["wind"]["speed"]
  end

  define_method :wind_deg do
    direction(root_json["wind"]["deg"])
  end

  define_method :rain_check do
    felled?(root_json["rain"])
  end

  define_method :snow_check do
    felled?(root_json["snow"])
  end

  def direction(direction_no)
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

  def falled?(check_target)
    if check_target.nil?
      return false
    else
      return true
    end
  end

  def weather_today
    url = "http://api.openweathermap.org/data/2.5/forecast?q=#{city_name},jp&units=metric&APPID=#{open_weather_key}"
    request = Request.new(url)
    request.get['list']
  end

end
