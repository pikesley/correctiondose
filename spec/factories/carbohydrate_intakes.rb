FactoryGirl.define do
  factory :carbohydrate_intake do |f|
    f.datetime '2016-01-29 21:25:11'
    f.weight 70
    f.description 'pasta bolognese'
  end

  factory :invalid_carbohydrate_intake, parent: :carbohydrate_intake do |f|
    f.weight -10
  end
end
