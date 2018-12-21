class Threshold < ApplicationRecord
  def self.threshold_latest(city_name)
    self.where(city_name:city_name)
        .pluck(:wind_speed)
        .last
        .to_f
        .round(2)
  end

  def self.threshold_update(city_name)
    result = Weather.where(city_name:city_name)
                    .average(:wind_speed)
                    .to_f
                    .round(2)

    self.create(
      wind_speed:result,
      city_name:city_name
    )
  end

end
