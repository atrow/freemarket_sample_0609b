class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]

  def index
   @ladies_products = Product.where(category_id: 1, product_status_id: 1).limit(4).includes(:images)
   @mens_products = Product.where(category_id: 2, product_status_id: 1).limit(4).includes(:images)
   @kids_products = Product.where(category_id: 3, product_status_id: 1).limit(4).includes(:images)
   @cosme_products = Product.where(category_id: 7, product_status_id: 1).limit(4).includes(:images)
   @chanel_products = Product.where(brand_id: 1, product_status_id: 1).limit(4).includes(:images)
   @Vuitton_products = Product.where(brand_id: 2, product_status_id: 1).limit(4).includes(:images)
   @Supreme_products = Product.where(brand_id: 3, product_status_id: 1).limit(4).includes(:images)
   @nike_products = Product.where(brand_id: 4, product_status_id: 1).limit(4).includes(:images)
  end

  def new
    # モデルオブジェクト生成
    @product = Product.new
    10.times {@product.images.build}
    @conditions = Condition.all
    @delivery_fee_pays = DeliveryFeePay.all
    @delivery_off_days = DeliveryOffDay.all
    @delivery_ways = DeliveryWay.all
    @prefectures = Prefecture.all
    @conditions = Condition.all
    @brands = Brand.all
    @categories = Category.get_all_grandchildren
    @product.build_purchase
  end

  def create
    # formのデータを受け取る
    @product = Product.new(product_params)
    # save確認
    if @product.save
      redirect_to root_path
    end
  end

  def edit

  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    end
  end

  private

  def product_params
    # ストロングパラメータ
    params.require(:product).
      permit(:name, :description, :price, :condition_id, :brand_id,
      :delivery_fee_pay_id, :delivery_off_area_id, :delivery_off_day_id, :delivery_way_id,
      :category_id, :product_status_id,
      images_attributes: [:image],
      purchase_attributes: [:seller_id]
      )
    end

  def set_product
    # データ取得
    @product = Product.find(params[:id])
    @images = @product.images
    @purchase = @product.purchase
  end
end
