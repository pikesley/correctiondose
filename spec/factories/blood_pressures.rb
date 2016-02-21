FactoryGirl.define do
  factory :blood_pressure do |f|
    f.datetime '2016-02-21 15:53:15'
    f.reading '130/82'
  end

  factory :invalid_blood_pressure, parent: :blood_pressure do |f|
    f.reading 'hat'
  end
end
