class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:update]

  require 'payjp'

  Payjp.api_key = Rails.application.secrets.payjp_private_key_test

  def update

    # データ更新
    if @purchase.update(purchase_params)
      # 関連商品の商品ステータスを売り切れに更新
      @purchase.product.product_status_id = ProductStatus.find(2).id
      @purchase.product.save

      # Payjp
      create_charge(create_token, @purchase.payment)

      # トップページへリダイレクト
      redirect_to root_path
    end
  end

  private

  def purchase_params
    # ストロングパラメータ
    params.require(:purchase).permit(:payment, :buyer_id)
  end

  def create_token
    # Payjpトークン作成
    # VISAテストカードを使用
    token = Payjp::Token.create(
      card: {
        number:    '4242424242424242',
        cvc:       '123',
        exp_year:  '2020',
        exp_month: '2',
      }
    )
    return token[:id]
  end

  def create_charge(token, amount)
    Payjp::Charge.create(
      amount:   amount,
      card:     token,
      currency: 'jpy'
    )
  end

  def set_purchase
    # データ取得
    @purchase = Purchase.find(params[:id])
  end
end
