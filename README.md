# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 
2.5.1

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#Design Database

## productsテーブル(商品)
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|name|varchar|null: false,index: true|
|description|varchar|null: false|
|price|integer|null: false|
|condition|integer|null: false,foreign_key: true|
|shipping_fee_pay|integer|null: false,foreign_key: true|
|shipping_off_area|integer|null: false,foreign_key: true|
|shipping_off_day|integer|null: false,foreign_key: true|
|sold_out_status|integer|foreign_key: true|
######参考サイトhttp://www.coma-tech.com/archives/223/

### Association
- belongs_to :user
- belongs_to :condition
- belongs_to :shipping_fee_pay
- belongs_to :shipping_off_area
- belongs_to :shipping_off_day
- belongs_to :size_type
- belongs_to :brand
- belongs_to :sold_out_status
- has_many :comments, dependent: :destroy
- has_many :product_pictures, dependent: :destroy
- has_many :categorys
- has_many :likes, dependent: :destroy
- has_many :users, through: :likes
- has_many :purchases
- has_many :sellers, :through => :purchases
- has_many :buyers, :through => :purchases

## product_picturesテーブル(商品写真)
|Column|Type|Options|
|------|----|-------|
|product_picture|integer|

### Association
- belongs_to :product 

## brandsテーブル（ブランド）
|Column|Type|Options|
|------|----|-------|
|brand_name|varchar|null: false,unique: true|
### Association
- has_many :products

## conditionsテーブル（商品状態）
|Column|Type|Options|
|------|----|-------|
|condition||varchar|null: false,unique: true|
### Association
- has_many :products

## sizeテーブル(サイズ)
|Column|Type|Options|
|------|----|-------|
|size|varchar|null: false|
### Association
- has_many :products

## size_typesテーブル(サイズ種別)
|Column|Type|Options|
|------|----|-------|
|size_type|varchar|null: false|
### Association
- has_many :sizes

## categorysテーブル(カテゴリ)
|Column|Type|Options|
|------|----|-------|
|category_name|varchar|null: false|
|parent_id||
######参考サイトhttps://qiita.com/chopin3/items/ca5525406ef005086e59,https://jvvg0oynveolxikm.qrunch.io/entries/3JG4bNOVyRgNxVGt
### Association
- has_many :products
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :parent_id

## delivery_fee_paysテーブル（配送料負担）
|Column|Type|Options|
|------|----|-------|
|delivery_fee_pay|varchar|null: false|
### Association
- has_many :products

## delivery_waysテーブル（配送方法）
|Column|Type|Options|
|------|----|-------|
|delivery_way|varchar|null: false|
### Association
- has_many :products

## shipping_off_daysテーブル（配送日数）
|Column|Type|Options|
|------|----|-------|
|shipping_off_day|varchar|null: false|
### Association
- has_many :products

## shipping_off_areasテーブル（発送地域）
|Column|Type|Options|
|------|----|-------|
|shipping_off_area|varchar|null: false|
### Association
- has_many :products

## likesテーブル（いいね！）
|Column|Type|Options|
|------|----|-------|
######https://qiita.com/shiro-kuro/items/f017dce3d199f06d1dcd
### Association
- belongs_to :product, counter_cache: :likes_count
- belongs_to :user

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|nickname|varchar|null: false|
|email|integer|null: false, unique: true|
|password|varchar|null: false|
|family_name|varchar|null: false|
|first_name|varchar|null: false|
|family_name_kana|varchar|null: false|
|first_name_kana|varchar|null: false|
|birth_mm|integer|null: false|
|birth_dd|integer|null: false|
|birth_yyyy|integer|null: false|
|gender|integer|null: false|
######参考サイトhttp://www.coma-tech.com/archives/223/

### Association
- has_one :user_detail, dependent: :destroy
- has_many :products, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :cards, dependent: :destroy
- has_many :comments
- has_many :user_deliverys, dependent: :destroy
- has_many :purchases_of_seller, :class_name => 'Purchases', :foreign_key => 'seller_id'
- has_many :purchases_of_buyer, :class_name => 'Purchases', :foreign_key => 'buyer_id'
- has_many :products_of_seller, :through => :deals_of_seller, :source => 'product'
- has_many :products_of_buyer, :through => :deals_of_buyer, :source => 'product'

## users_productsテーブル（中間テーブル）
|Column|Type|Options|
|------|----|-------|
### Association
- belongs_to :product
- belongs_to :user

## user_detailsテーブル（ユーザ詳細情報）
|Column|Type|Options|
|------|----|-------|
|zip_code|integer|null: false|
|region|varchar|null: false|
|city|varchar|null: false|
|street|varchar|null: false|
|building_name|varchar|
|sms_authentication|integer|null: false, unique: true|
|avatar_image|integer|
|avatar_text|varchar|
|provider|integer|
|uid|integer|
|facebook_email|varchar|
|facebook_name|integer|
|google_email|varchar|

### Association
- belongs_to :user

## user_deliverysテーブル（ユーザ配送情報）
|Column|Type|Options|
|------|----|-------|
|ship_family_name|varchar|null: false|
|ship_first_name|varchar|null: false|
|ship_family_name_kana|varchar|null: false|
|ship_first_name_kana|varchar|null: false|
|zip_code|integer|null: false|
|region|varchar|null: false|
|city|varchar|null: false|
|street|varchar|null: false|
|building_name|varchar|
|phone|integer|

### Association
- has_many :purchases
- belongs_to :user

## cardsテーブル（クレジットカード）
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|card_mm|integer|null: false|
|card_yyyy|integer|null: false|
|security_code|integer|null: false|

### Association
- has_many :purchases
- belongs_to :user

## reportsテーブル(受取評価/被評価ユーザーID)
|Column|Type|Options|
|------|----|-------|
|buyer_comment|varchar|
|seller_comment|varchar|
|user_id|references|null: false,foreign_key: true|

### Association
- belongs_to :reputation_type
- belongs_to :perchase
- belongs_to :user

## reputation_typesテーブル(良い/普通/悪い)
|Column|Type|Options|
|------|----|-------|
|reputation_type|varchar|
### Association
- has_many :reports 

## commentsテーブル（コメント）
|Column|Type|Options|
|------|----|-------|
|comment|varchar|null: false|
|day_ago|daytime|
### Association
- belongs_to :product 
- belongs_to :user

## perchasesテーブル(取引)
|Column|Type|Options|
|------|----|-------|
|payment|integer|
|profit|integer|
|buyer_user|integer|
|seller_user|integer|null: false|
######参考サイトhttp://www.coma-tech.com/archives/223/
### Association
- has_many :reports
- belongs_to :user
- belongs_to :card
- belongs_to :user_delivery
- belongs_to :seller, :class_name => 'User'
- belongs_to :buyer, :class_name => 'User'
- belongs_to :product

## pointsテーブル（保有ポイント）
|Column|Type|Options|
|------|----|-------|
|point|integer|
1ポイント=1円として、商品を購入するときに利用できます。

### Association
- belongs_to :user

## todosテーブル(やることリスト)
|Column|Type|Options|
|------|----|-------|
|todo|varchar|
|todo_done|varchar|
### Association
- belongs_to :user
- belongs_to :product 

## profitsテーブル(売上金)
|Column|Type|Options|
|------|----|-------|
|profit|integer|

### Association
- belongs_to :user
- belongs_to :product 

## product_statusテーブル(出品中/売り切れ/出品削除)
|Column|Type|Options|
|------|----|-------|
|sold_out_status|varchar|null: false|
### Association
- belongs_to :product




