class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:edit, :update]

  require 'payjp'

  Payjp.api_key = Rails.application.secrets.payjp_private_key_test

  def update

    # データ更新
    if @purchase.update(purchase_params)
      # 関連商品の商品ステータスを売り切れに更新
      @purchase.product.product_status_id = ProductStatus.find(2).id
      @purchase.product.save

      # Payjp
      create_charge(@purchase.payment)

      # トップページへリダイレクト
      redirect_to root_path
    end
  end

  private

  def purchase_params
    # ストロングパラメータ
    params.require(:purchase).permit(:payment, :buyer_id)
  end

  def create_charge(amount)
    Payjp::Charge.create(
      amount:   amount,
      card:     params['payjp-token'],
      currency: 'jpy'
    )
  end

  def set_purchase
    # データ取得
    @purchase = Purchase.find(params[:id])
    @derivery = current_user.user_deriverys.first
    @image = @purchase.product.images.first
  end
end
