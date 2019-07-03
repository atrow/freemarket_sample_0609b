require 'rails_helper'
describe ProductsController do
  before do
    grandchildren = []
    grandchildren << FactoryBot.build(:category, category: "Tシャツ/カットソー", parent_id: "14")
    grandchildren << FactoryBot.build(:category, category: "ポロシャツ", parent_id: "14")
    grandchildren << FactoryBot.build(:category, category: "パーカー", parent_id: "14")
    allow(Category).to receive(:get_all_grandchildren).and_return(grandchildren)
  end
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
  describe 'GET #edit' do
    it "assigns the requested product to @product" do
      product = FactoryBot.create(:product)
      get :edit, params: { id: product }
      expect(assigns(:product)).to eq product
    end

    it "renders the :edit template" do
      product = FactoryBot.create(:product)
      get :edit, params: { id: product }
      expect(response).to render_template :edit
    end
  end
  describe 'POST #create' do
    let(:params) { { product: FactoryBot.attributes_for(:product) } }
    context 'can save' do
      it 'count up product' do
        image = [ FactoryBot.attributes_for(:image, product: params) ]
        params[:product][:images_attributes] = image
        expect{
          post :create,
          params: params
        }.to change(Product, :count).by(1).and change(Image, :count).by(1)
      end

      # TODO: トップページとマージ後に実装
      # it 'redirects to root_path' do
      #   subject
      #   expect(response).to redirect_to(root_path)
      # end
    end
  end
end
