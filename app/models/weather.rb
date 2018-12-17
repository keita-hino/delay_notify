class Weather < ApplicationRecord
  def self.wind_speed_average(city_name)
    self.where(city_name:city_name)
        .average(:wind_speed)
        .to_f
        .round(2)
  end
end
