FactoryBot.define do
  factory :brand do
    brand {"ブランド"}
    category_id {FactoryBot.create(:category).id}
  end
end
