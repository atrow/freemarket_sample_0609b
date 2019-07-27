FactoryBot.define do
  factory :image do
    # image { Faker::Avatar.image }
    image { "https://cdn.pixabay.com/photo/2019/07/03/09/41/national-history-museum-4314035_960_720.jpg" }
    product
  end
end
