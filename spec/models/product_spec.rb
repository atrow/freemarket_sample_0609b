require 'rails_helper'
describe Product do
  describe '#create' do
    it "price が300円以上であること " do
      product = build(:product, price: 300)
      expect(product).to be_valid
    end

    it "price が9,999,999円以下であること" do
      product = build(:product, price: 9999999)
      expect(product).to be_valid
    end

    it "price が299円以下ならエラー" do
      product = build(:product, price: 299)
      product.valid?
      expect(product.errors[:price]).to include("は300以上の値にしてください")
    end

    it "price が10,000,000円以上ならエラー" do
      product = build(:product, price: 10000000)
      product.valid?
      expect(product.errors[:price]).to include("は9999999以下の値にしてください")
    end

    it "price が整数ではないならエラー" do
      product = build(:product, price: 100.0)
      product.valid?
      expect(product.errors[:price]).to include("は整数で入力してください")
    end

    it "name が nil ならエラー" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "description が nil ならエラー" do
      product = build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to include("を入力してください")
    end

    it "condition が nil ならエラー" do
      product = build(:product, condition: nil)
      product.valid?
      expect(product.errors[:condition]).to include("を入力してください")
    end

    it "delivery_fee_pay が nil ならエラー" do
      product = build(:product, delivery_fee_pay: nil)
      product.valid?
      expect(product.errors[:delivery_fee_pay]).to include("を入力してください")
    end

    it "delivery_way が nil ならエラー" do
      product = build(:product, delivery_way: nil)
      product.valid?
      expect(product.errors[:delivery_way]).to include("を入力してください")
    end

    it "delivery_off_area が nil ならエラー" do
      product = build(:product, delivery_off_area: nil)
      product.valid?
      expect(product.errors[:delivery_off_area]).to include("を入力してください")
    end

    it "delivery_off_day が nil ならエラー" do
      product = build(:product, delivery_off_day: nil)
      product.valid?
      expect(product.errors[:delivery_off_day]).to include("を入力してください")
    end

    it "category が nil ならエラー" do
      product = build(:product, category: nil)
      product.valid?
      expect(product.errors[:category]).to include("を入力してください")
    end
  end
end
