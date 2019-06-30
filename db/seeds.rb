# coding: utf-8
require "csv"

CSV.foreach('db/category.csv') do |row|
  Category.create!(category: row[0], size_type_id: row[1], parent_id: row[2])
end
