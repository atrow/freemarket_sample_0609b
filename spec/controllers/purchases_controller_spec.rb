require 'rails_helper'
describe PurchasesController do
  let(:user) { create(:user) }
  describe 'PATCH #update' do
    let(:buyer) { create(:user) }
    let(:product) { create(:product) }
    let(:purchase) { create(:purchase, product: product, payment: product.price, seller_id: user.id) }
    before do
      login_user user
      allow(Payjp::Token).to receive(:create).and_return(PayjpMock.create_token)
      allow(Payjp::Charge).to receive(:create).and_return(PayjpMock.create_charge)
      patch :update, params: { id: purchase.id, purchase: attributes_for(:purchase, product: product, buyer_id: buyer.id)}
      purchase.reload
      product.reload
  end
    context 'update される' do
      it 'purchase の更新内容が正しいか' do
        expect(purchase.buyer_id).to eq(buyer.id)
      end
      it 'product の更新内容が正しいか' do
        expect(product.product_status_id).to eq(ProductStatus.find(2).id)
      end
      it "root_path にリダイレクトするか" do
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
