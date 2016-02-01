FactoryGirl.define do
  factory :food_item do |f|
    f.source 'Lower East Side Deli'
    f.name 'Ruben'
  end

  factory :invalid_food_item, parent: :food_item do |f|
    f.source nil
  end
end
