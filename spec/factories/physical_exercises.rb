FactoryGirl.define do
  factory :physical_exercise do |f|
    f.datetime '2016-01-30 15:45:43'
    f.duration 90
    description 'drumming'
  end

  factory :invalid_physical_exercise, parent: :physical_exercise do |f|
    f.duration 0
  end
end
