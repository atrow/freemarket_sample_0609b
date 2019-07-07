FactoryBot.define do
  factory :category do
    category {"レディース"}
    brand_exist {true}
    parent_id {nil}
    size_type_id {nil}
  end
end
