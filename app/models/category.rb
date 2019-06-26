class Category < ApplicationRecord
  has_many :products
  belongs_to :parent, class_name: :Category, optional: true
  has_many :children, class_name: :Category, foreign_key: :parent_id

  def self.get_all_children
    # 全子カテゴリー（2階層目）を取得
    Category.all.children
  end

  def self.get_children(id)
    # 指定したカテゴリーの子カテゴリーを取得
    Category.find(id).children
  end

  def self.get_all_grandchildren
    # 全孫カテゴリー（3階層目）を取得
    # @category = Category.all
    # @category.children.map { |category| category.children }
    Category.all.children.children
  end

  def self.get_progeny(id)
    # 指定したカテゴリーの子孫カテゴリーを配列にして取得
    @category = Category.find(params[:id])
    @categories = [
      # @categoryを取得
      @category,
      # @categoryの子カテゴリーを全て取得
      @category.children,
      # @categoryの子カテゴリーの子カテゴリーを全て取得
      @category.children.map { |category| category.children }
    ].flatten.compact
  end
end
