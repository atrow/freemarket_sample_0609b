class Category < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :products
  belongs_to :parent, class_name: :Category, optional: true
  has_many :children, class_name: :Category, foreign_key: :parent_id
  belongs_to :size_type

  def self.get_all_parents
    # 全親カテゴリー（1階層目）を取得
    @categories = Category.where(parent_id: nil)
  end

  def self.get_all_children
    # 全子カテゴリー（2階層目）を取得
    category1 = Category.where(parent_id: nil)
    @categories = Category.where(parent_id: category1.ids)
  end

  def self.get_children(id)
    # 指定したカテゴリーの子カテゴリーを取得
    Category.find(id).children
  end

  def self.get_all_grandchildren
    # 全孫カテゴリー（3階層目）を取得
    category1 = Category.where(parent_id: nil)
    category2 = Category.where(parent_id: category1.ids)
    @categories = Category.where(parent_id: category2.ids)
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
