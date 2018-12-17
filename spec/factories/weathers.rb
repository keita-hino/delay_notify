FactoryBot.define do
  factory :weather do
    rain          { true }
    snow          { true }
    wind_deg      { '北西' }
    wind_speed    { 16 }
    city_name     { 'ishinomaki' }
  end
end
