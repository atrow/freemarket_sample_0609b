class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]

  def index

  end

  def new
    # モデルオブジェクト生成
    @product = Product.new
    @product.product_pictures.build
    @condition = Condition.all
    @delivery_fee_pay = DeliveryFeePay.all
    @delivery_off_day = DeliveryOffDay.all
    @prefecture = Prefecture.all
    @condition = Condition.all
    @brand = Brand.all
    @category = Category.get_all_grandchildren
  end

  def create
    # formのデータを受け取る
    @product = Product.create(product_params)

    # save確認
    if @product.save
      # TODO: トップページとマージ後に実装
      # redirect_to root_path
    end
  end

  def edit

  end

  def update
    if @product.update(product_params)
      # TODO: トップページとマージ後に実装
      # redirect_to root_path
    end
  end

  private

  def product_params
    # ストロングパラメータ
    params.require(:product).
      permit(:name, :description, :price, :condition_id, :brand_id,
      :delivery_fee_pay_id, :delivery_off_area_id, :delivery_off_day_id,
      :category_id, :product_status_id, :purchases_id,
      product_pictures_attributes: [:product_picture])
  end

  def set_product
    # データ取得
    @product = Product.find(params[:id])
    @product_pictures = @product.product_pictures
  end
end
