FactoryGirl.define do
  factory :glucose_measurement do |f|
    f.time '2016-01-26 21:42:29'
    f.value 6.0
  end

  factory :invalid_glucose_measurement, parent: :glucose_measurement do |f|
    f.value -1
  end
end
