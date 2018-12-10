class Threshold < ApplicationRecord
  def self.threshold_latest(city_name)
    self.where(city_name:"ishinomaki")
        .pluck(:wind_speed)
        .last.to_f
        .round(2)
  end
end
