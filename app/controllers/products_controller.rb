class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]

  def index

  end

  def new
    # モデルオブジェクト生成
    @product = Product.new
    10.times {@product.images.build}
    @condition = Condition.all
    @delivery_fee_pay = DeliveryFeePay.all
    @delivery_off_day = DeliveryOffDay.all
    @prefecture = Prefecture.all
    @condition = Condition.all
    @brand = Brand.all
    @category = Category.get_all_grandchildren
    @product.build_purchase
  end

  def create
    # formのデータを受け取る
    @product = Product.new(product_params)
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
      :category_id, :product_status_id,
      images_attributes: [:image]
      # TODO ユーザモデル実装後に実装
      # purchase_attributes: [seller_id: current_user_id]
      )
    end

  def set_product
    # データ取得
    @product = Product.find(params[:id])
    @images = @product.images
    @purchase = @product.purchase
  end
end
