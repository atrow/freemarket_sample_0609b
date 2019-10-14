module ControllerMacros

  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = FactoryBot.create(:admin, role: FactoryBot.create(:role_admin))
      sign_in admin
    end
  end

  def login_user(user)
    allow(controller).to receive(:authenticate_user!).and_return true
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end
end
