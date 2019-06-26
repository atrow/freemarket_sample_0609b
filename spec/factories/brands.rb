FactoryBot.define do
  factory :brand do
    brand_name {"ブランド"}
    category_id {FactoryBot.create(:category).id}
  end
end
