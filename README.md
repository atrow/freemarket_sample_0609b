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

# Design Database

## productsテーブル(商品)
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|name|varchar|null: false,index: true|
|description|varchar|null: false|
|price|bigdecimal|null: false|
|condition|integer|null: false,foreign_key: true|
|brand|integer|null: false,foreign_key: true|
|shipping_fee_pay|integer|null: false,foreign_key: true|
|shipping_off_area|integer|null: false,foreign_key: true|
|shipping_off_day|integer|null: false,foreign_key: true|
|product_status|integer|foreign_key: true|
|created_at|datetime|null: false|
|updated_at|datetime|null: false|

### Association
- belongs_to :user
- belongs_to :condition
- belongs_to :shipping_fee_pay
- belongs_to :shipping_off_area
- belongs_to :shipping_off_day
- belongs_to :category
- belongs_to :brand
- belongs_to :sold_out_status
- has_many :comments, dependent: :destroy
- has_many :product_pictures, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :users, through: :likes
- has_many :purchases
- has_one :sellers, through: :purchases
- has_one :buyers, through: :purchases

## product_picturesテーブル(商品写真)
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|product_picture|integer|
### Association
- belongs_to :product 

## brandsテーブル（ブランド）
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|brand_name|varchar|null: false, unique: true|
### Association
- has_many :products

## conditionsテーブル（商品状態）
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|condition||varchar|null: false, unique: true|
### Association
- has_many :products

## sizesテーブル(サイズ４タイプ・サイズ）
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|size_type|varchar|null: false,foreign_key: true|
|parent_id|integer|null: false|
### Association
- has_many :products
- belongs_to :size_type

## size_typesテーブル(大人服・子供服・大人靴・子供靴)
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|size_type|varchar|null: false|
### Association
- has_many :sizes

## categorysテーブル(LMSサイズカテゴリの隣接リスト)
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|size|integer|null: false, foreign_key: true|
|l_categpry|integer|null: false, foreign_key: true|
|m_categpry|integer|foreign_key: true|
|s_categpry|integer|foreign_key: true|
|parent|integer|
|brand_exist|boolean|default: false|
###### 木構造の参考サイト
https://qiita.com/chopin3/items/ca5525406ef005086e59
https://jvvg0oynveolxikm.qrunch.io/entries/3JG4bNOVyRgNxVGt
https://techracho.bpsinc.jp/hira/2018_03_15/53872r
### Association
- has_many :products
- belongs_to :parent, class_name: :Category
- has_many :children, class_name: :Category, foreign_key: :parent_id

## delivery_fee_paysテーブル（配送料負担）
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|delivery_fee_pay|varchar|null: false|
### Association
- has_many :products

## delivery_waysテーブル（配送方法）
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|delivery_way|varchar|null: false|
### Association
- has_many :products

## shipping_off_daysテーブル（配送日数）
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|shipping_off_day|varchar|null: false|
### Association
- has_many :products

## shipping_off_areasテーブル（発送地域）
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|shipping_off_area|varchar|null: false|
### Association
- has_many :products

## likesテーブル（いいね！）
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
###### いいねの実装参考サイト
https://qiita.com/shiro-kuro/items/f017dce3d199f06d1dcd
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
###### 商品取引関連付けの参考サイト
http://www.coma-tech.com/archives/223/
### Association
- has_one :user_detail, dependent: :destroy
- has_many :products, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :cards, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :user_deliverys, dependent: :destroy
- has_many :purchases_of_seller, class_name: 'Purchase', foreign_key: 'seller_id'
- has_many :purchases_of_buyer, class_name: 'Purchase', foreign_key: 'buyer_id'
- has_many :products_of_seller, through: :deals_of_seller, source: 'product'
- has_many :products_of_buyer, through: :deals_of_buyer, source: 'product'
- has_many :sns_credentials, dependent: :destroy

## sns_credentialテーブル（facebook/google認証）
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|provider|integer|
|uid|integer|
|token|integer|
|facebook_email|varchar|
|facebook_name|integer|
|google_email|varchar|
|google_name|varchar|
###### google・facebookユーザ認証の参考サイト
https://qiita.com/bino98/items/596b5cffeca7c104bd90
### Association
- belongs_to :user, optional: true


## user_detailsテーブル（ユーザ詳細情報）
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|zip_code|integer|null: false|
|region|varchar|null: false|
|city|varchar|null: false|
|street|varchar|null: false|
|building_name|varchar|
|sms_authentication|integer|null: false, unique: true|
|avatar_image|integer|
|avatar_text|varchar|
### Association
- belongs_to :user

## user_deliverysテーブル（ユーザ配送情報）
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
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
|id|integer|primary key|
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
|id|integer|primary key|
|comment|varchar|ull: false|
### Association
- belongs_to :reputation_type
- belongs_to :perchase
- belongs_to :user
- belongs_to :product

## reputation_typesテーブル(良い/普通/悪い)
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|reputation_type|varchar|
### Association
- has_many :reports 

## commentsテーブル（コメント）
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|comment|varchar|null: false|
|time|daytime|
### Association
- belongs_to :product 
- belongs_to :user

## perchasesテーブル(取引)
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|payment|bigdecimal|
|profit|integer|
|buyer_user|integer|
|seller_user|integer|null: false|
###### 商品取引関連付けの参考サイトhttp://www.coma-tech.com/archives/223/
### Association
- has_one :report
- belongs_to :user
- belongs_to :card
- belongs_to :user_delivery
- belongs_to :seller, class_name: 'User'
- belongs_to :buyer, class_name: 'User'
- belongs_to :product

## pointsテーブル（保有ポイント）
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|point|bigdecimal|
###### 1ポイント=1円として商品を購入するときに利用できます。
### Association
- belongs_to :user

## todosテーブル(やることリスト)
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|todo|varchar|
|todo_done|varchar|
### Association
- belongs_to :user
- belongs_to :product 

## profitsテーブル(売上金)
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|profit|bigdecimal|
### Association
- has_one :purchase
- belongs_to :user
- belongs_to :product

## product_statusテーブル(出品中/売り切れ/出品削除)
|Column|Type|Options|
|------|----|-------|
|id|integer|primary key|
|sold_out_status|varchar|null: false|
### Association
- belongs_to :product


