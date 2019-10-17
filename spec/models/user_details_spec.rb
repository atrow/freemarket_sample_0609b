require 'rails_helper'
describe UserDetail do
  #全てのカラムが入力された時登録できる
  it "is valid with prefecture_id, zip_code, city, street, building_name, phone" do
    user_detail = build(:user_detail)
    expect(user_detail).to be_valid
  end
  #都道府県・郵便番号・市区町村・番地が入力された時登録できる ただし電話番号と建物名は任意
  it "is valid with prefecture_id, zip_code, city, street" do
    user_detail = build(:user_detail, building_name: nil, phone: nil)
    expect(user_detail).to be_valid
  end

  #それぞれのカラムが入力されていない時は登録できない
  it "is invalid without a prefecture_id" do
     user_detail = build(:user_detail, prefecture_id: nil)
     user_detail.valid?
     expect(user_detail.errors[:prefecture_id]).to include("を入力してください")
  end

  it "is invalid without a zip_code" do
    user_detail = build(:user_detail, zip_code: nil)
    user_detail.valid?
    expect(user_detail.errors[:zip_code]).to include("を入力してください")
  end

 #７桁の郵便番号が入力されていない時は登録できない
  it "is invalid without a 7-digit zip_code" do
    user_detail = build(:user_detail, zip_code: "1")
    user_detail.valid?
    expect(user_detail.errors[:zip_code]).to include("は不正な値です")
  end

  it "is invalid without a 7-digit zip_code" do
    user_detail = build(:user_detail, zip_code: "88888888")
    user_detail.valid?
    expect(user_detail.errors[:zip_code]).to include("は不正な値です")
  end
  #７桁の郵便番号でもハイフンが入力されている時は登録できない
  it "is invalid without a 7-digit zip_code" do
    user_detail = build(:user_detail, zip_code: "888-8888")
    user_detail.valid?
    expect(user_detail.errors[:zip_code]).to include("は不正な値です")
  end

  it "is invalid without a city" do
    user_detail = build(:user_detail, city: nil)
    user_detail.valid?
    expect(user_detail.errors[:city]).to include("を入力してください")
  end

  it "is invalid without a street" do
    user_detail = build(:user_detail, street: nil)
    user_detail.valid?
    expect(user_detail.errors[:street]).to include("を入力してください")
  end
  #それぞれのカラムが入力されていない時は登録できない、ただしbuilding_nameは任意
  it "building_name is blank and valid" do
    user_detail = build(:user_detail, building_name: nil)
    expect(user_detail).to be_valid
  end
  #それぞれのカラムが入力されていない時は登録できない、ただしphoneは任意
  it "phone is blank and valid" do
    user_detail = build(:user_detail, phone: nil)
    expect(user_detail).to be_valid
  end
end
