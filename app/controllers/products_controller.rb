class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    @ladies_products = Product.where(product_status_id: 1).get_ladies.recent
    @cosme_products = Product.where(product_status_id: 1).recent
  end

  def new
    # モデルオブジェクト生成
    @product = Product.new
    @product.build_purchase
    10.times {@product.images.build}
  end

  def create
    # formのデータを受け取る
    @product = Product.new(product_params)
    # save確認
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    count = @product.images.length
    @product = Product.find(params[:id])
    10.times { @product.images.build }
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to root_path
    end
  end

  def search
    @products = Product.search(params[:product_name])
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def product_params
    # ストロングパラメータ
    params.require(:product).
      permit(:name, :description, :price, :condition_id, :brand_id,
      :delivery_fee_pay_id, :delivery_off_area_id, :delivery_off_day_id, :delivery_way_id,
      :category_id, :product_status_id,
      images_attributes: [:image, :_destroy, :id],
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
