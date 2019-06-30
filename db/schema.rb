# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_30_052832) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "brand_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_brands_on_category_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "brand_exist", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category", null: false
    t.bigint "size_id", null: false
    t.bigint "parent_id", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
    t.index ["size_id"], name: "index_categories_on_size_id"
  end

  create_table "conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "condition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_fee_pays", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "delivery_fee_pay", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_off_days", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "delivery_off_day", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perchases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "payment", precision: 10
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_perchases_on_product_id"
  end

  create_table "product_pictures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "product_picture"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_pictures_on_product_id"
  end

  create_table "product_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "product_status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.decimal "price", precision: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "condition_id", null: false
    t.bigint "brand_id", null: false
    t.bigint "delivery_fee_pay_id", null: false
    t.bigint "delivery_off_area_id", null: false
    t.bigint "delivery_off_day_id", null: false
    t.bigint "category_id", null: false
    t.bigint "product_status_id", null: false
    t.bigint "perchases_id"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["condition_id"], name: "index_products_on_condition_id"
    t.index ["delivery_fee_pay_id"], name: "index_products_on_delivery_fee_pay_id"
    t.index ["delivery_off_area_id"], name: "index_products_on_delivery_off_area_id"
    t.index ["delivery_off_day_id"], name: "index_products_on_delivery_off_day_id"
    t.index ["perchases_id"], name: "index_products_on_perchases_id"
    t.index ["product_status_id"], name: "index_products_on_product_status_id"
  end

  create_table "regions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "region", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "size_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "size_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "size", null: false
    t.bigint "size_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["size_type_id"], name: "index_sizes_on_size_type_id"
  end

  create_table "user_deriveries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "family_name", null: false
    t.string "family_name_kana", null: false
    t.string "first_name", null: false
    t.string "first_name_kana", null: false
    t.string "city", null: false
    t.string "street", null: false
    t.string "building_name"
    t.integer "zip_code", null: false
    t.integer "phone"
    t.bigint "region_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_user_deriveries_on_region_id"
    t.index ["user_id"], name: "index_user_deriveries_on_user_id"
  end

  create_table "user_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "zip_code", null: false
    t.string "city", null: false
    t.string "street", null: false
    t.string "building_name"
    t.string "avatar_image"
    t.string "avatar_text"
    t.bigint "user_id", null: false
    t.bigint "region_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_user_details_on_region_id"
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "user_ditails", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "zip_code", null: false
    t.string "city", null: false
    t.string "street", null: false
    t.string "building_name"
    t.string "avatar_image"
    t.string "avatar_text"
    t.bigint "user_id", null: false
    t.bigint "region_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_user_ditails_on_region_id"
    t.index ["user_id"], name: "index_user_ditails_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "nickname", null: false
    t.string "family_name", null: false
    t.string "family_name_kana", null: false
    t.string "first_name", null: false
    t.string "first_name_kana", null: false
    t.string "encrypted_password", default: "", null: false
    t.date "birthday", null: false
    t.bigint "region_id", null: false
    t.integer "gender", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["region_id"], name: "index_users_on_region_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "brands", "categories"
  add_foreign_key "categories", "categories", column: "parent_id"
  add_foreign_key "categories", "sizes"
  add_foreign_key "perchases", "products"
  add_foreign_key "product_pictures", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "conditions"
  add_foreign_key "products", "delivery_fee_pays"
  add_foreign_key "products", "delivery_off_days"
  add_foreign_key "products", "perchases", column: "perchases_id"
  add_foreign_key "products", "product_statuses"
  add_foreign_key "products", "regions", column: "delivery_off_area_id"
  add_foreign_key "sizes", "size_types"
  add_foreign_key "user_deriveries", "regions"
  add_foreign_key "user_deriveries", "users"
  add_foreign_key "user_details", "regions"
  add_foreign_key "user_details", "users"
  add_foreign_key "user_ditails", "regions"
  add_foreign_key "user_ditails", "users"
  add_foreign_key "users", "regions"
end
