class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.new user_params
        if verify_recaptcha(model: @user) && @user.save
          redirect_to account_login_path, notice: 'Success!'
        else
          render :new
        end
    end
end
