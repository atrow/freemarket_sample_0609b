require 'rails_helper'

describe User do
#全カラムが入力された時登録できる
  it "is valid with a nickname,family_name, family_name_kana, first_name, first_name_kana, email, password, password_confirmation" do
    user = build(:user)
    expect(user).to be_valid
  end
#それぞれのカラムが入力されていない時登録できない
  it "is invalid without a nickname" do
    user = build(:user, nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("can't be blank")
  end

  it "is invalid without a family_name" do
    user = build(:user, family_name: nil)
    user.valid?
    expect(user.errors[:family_name]).to include("can't be blank")
  end

  it "is invalid without a family_name_kana" do
    user = build(:user, family_name_kana: nil)
    user.valid?
    expect(user.errors[:family_name_kana]).to include("can't be blank")
  end

  it "is invalid without a first_name" do
    user = build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a first_name_kana" do
    user = build(:user, first_name_kana: nil)
    user.valid?
    expect(user.errors[:first_name_kana]).to include("can't be blank")
  end

  it "is invalid without a email" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without a password" do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
#passwordが存在してもpassword_confirmationが空では登録できない
  it "is invalid without a password_confirmation although with a password" do
    user = build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end
#重複したemailが存在する場合登録できない
  it "is invalid with a duplicate email address" do
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors[:email]).to include("has already been taken")
  end

#パスワードが５文字以下で登録できない
  it "is invalid with a password that has less than 5 characters " do
    user = build(:user, password: "00000", password_confirmation: "00000")
    user.valid?
    expect(user.errors[:password][0]).to include("is too short")
  end
#パスワードが6文字以上で登録できる
  it "is valid with a password that has less than 6 characters " do
    user = build(:user, password: "000000", password_confirmation: "000000")
    expect(user).to be_valid
  end
end