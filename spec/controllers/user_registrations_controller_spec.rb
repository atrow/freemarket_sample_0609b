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

  describe "POST #create" do
    context "verify_recaptchaメソッドで認証が成功" do
      it "成功レスポンスが返る" do
        user = instance_double('VerifyRecaptcha')
        allow(user).to receive(:verify_recaptcha).and_return(true)
        post :create
        expect(response).to have_http_status(200)
        expect { }.not_to raise_error
      end
    end
  end

  describe '#create' do
    let(:params) { { user: FactoryBot.attributes_for(:user) } }
    context 'can save' do
      subject {
        post :create,
        params: params
      }

      it 'ログインできているか' do
        expect(controller.user_signed_in?).to be false
       end
       it 'count up user' do
         expect{ subject }.to change(User, :count).by(1)
       end

      it 'count up user' do
        expect{ subject }.to change(User, :count).by(1)
      end
    end
  end
end
