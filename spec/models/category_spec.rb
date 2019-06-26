require 'rails_helper'
describe Category do
  before do
    category = FactoryBot.build(:category)
    categories = []
    categories << FactoryBot.build(:category, category: "トップス", parent_id: "1")
    categories << FactoryBot.build(:category, category: "ジャケット/アウター", parent_id: "1")
    categories << FactoryBot.build(:category, category: "パンツ", parent_id: "1")
    grandchildren = []
    grandchildren << FactoryBot.build(:category, category: "Tシャツ/カットソー", parent_id: "14")
    grandchildren << FactoryBot.build(:category, category: "ポロシャツ", parent_id: "14")
    grandchildren << FactoryBot.build(:category, category: "パーカー", parent_id: "14")
    progeny = []
    progeny << FactoryBot.build(:category)
    progeny << FactoryBot.build(:category, category: "トップス", parent_id: "1")
    progeny << FactoryBot.build(:category, category: "ジャケット/アウター", parent_id: "1")
    progeny << FactoryBot.build(:category, category: "パンツ", parent_id: "1")
    progeny << FactoryBot.build(:category, category: "Tシャツ/カットソー", parent_id: "14")
    progeny << FactoryBot.build(:category, category: "ポロシャツ", parent_id: "14")
    progeny << FactoryBot.build(:category, category: "パーカー", parent_id: "14")
    allow(Category).to receive(:get_all_children).and_return(category)
    allow(Category).to receive(:get_children).and_return(categories)
    allow(Category).to receive(:get_all_grandchildren).and_return(grandchildren)
    allow(Category).to receive(:get_progeny).and_return(progeny)
  end
  describe '#self.get_all_children' do
    it "finds all children" do
      category = Category.get_all_children
    end
  end
  describe '#self.get_children' do
    it "gets children" do
      categories = Category.get_children(1)
    end
  end
  describe '#self.get_all_grandchildren' do
    it "gets all grandchildren" do
      grandchildren = Category.get_all_grandchildren
    end
  end
  describe '#self.get_progeny' do
    it "gets progeny" do
      categories = Category.get_progeny(1)
    end
  end
end
