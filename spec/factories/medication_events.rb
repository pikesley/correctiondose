FactoryGirl.define do
  factory :medication_event do |f|
    f.datetime '2016-01-28 19:44:42'
    f.insulin 'humalog'
    f.amount 10
  end

  factory :invalid_medication_event, parent: :medication_event do |f|
    f.insulin 'unobtanium'
  end
end
