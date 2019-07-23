require 'rails_helper'
describe Product do
  describe '#create' do
    it "is valid with price greater than or equal to 300" do
      product = build(:product, price: 300)
      expect(product).to be_valid
    end

    it "is valid with price less than or equal to 9999999" do
      product = build(:product, price: 9999999)
      expect(product).to be_valid
    end

    it "is invalid with price less than 299" do
      product = build(:product, price: 299)
      product.valid?
      expect(product.errors[:price]).to include("は300以上の値にしてください")
    end

    it "is invalid with price greater than 10000000" do
      product = build(:product, price: 10000000)
      product.valid?
      expect(product.errors[:price]).to include("は9999999以下の値にしてください")
    end

    it "is invalid with price is not integer" do
      product = build(:product, price: 100.0)
      product.valid?
      expect(product.errors[:price]).to include("は整数で入力してください")
    end
  end
end
