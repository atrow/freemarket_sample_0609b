require 'rails_helper'
describe Users::RegistrationsController do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    let(:params) { { user: FactoryBot.attributes_for(:user) } }
    context 'can save' do
      subject {
        post :create,
        params: params
      }

      it 'count up user' do
        expect{ subject }.to change(User, :count).by(1)
      end
    end
  end
end