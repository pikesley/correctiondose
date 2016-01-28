FactoryGirl.define do
  factory :medication_event do |f|
    f.datetime '2016-01-28 19:44:42'
    f.type 'humalog'
    f.amount 10
  end
end
