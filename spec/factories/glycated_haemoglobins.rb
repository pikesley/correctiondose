FactoryGirl.define do
  factory :glycated_haemoglobin do |f|
    f.datetime '2016-02-20 17:11:12'
    f.percentage 6.0
  end

  factory :invalid_glycated_haemoglobin, parent: :glycated_haemoglobin do |f|
    f.percentage -10
  end
end
