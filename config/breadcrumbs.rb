# Root crumb 最上部 ’メルカリ’
crumb :root do
  link "メルカリ", root_path
end

#Root crumb 最上部 ’メルカリガイド’
crumb :guide do
  link "メルカリガイド"
end

# Root crumb 第二階層 ’メルカリ＞カテゴリー一覧’
crumb :parent_category do  |parent_category|
# category = Category.find(params[:id])
  link "大カテゴリー"

#link  category.name, category_path
#  if category.children.present?
#    parent :category.children
#  else
  parent:root
end

# Root crumb 第三階層 ’メルカリ＞カテゴリー一覧＞カテゴリー名’
crumb :child_category do |child_category|
# category = Category.find(params[:id])
  link "中カテゴリー"

#link category.name, category_path(id: category.id)
#  if category.grandchildren.present?
#    parent :category.grandchildren
#  else
  parent:parent_category
#  end
end

# Root crumb 第四階層 ’メルカリ＞カテゴリー一覧＞カテゴリー名’
crumb :grandchild_category do
  link "小カテゴリー"
#link category.name, category_path(id: category.id)
  parent:child_category
#  end
end


# Root crumb 第二階層 ’メルカリ＞ブランド一覧’
crumb :brands do
  link "ブランド一覧"
  #, brands_path
  parent:root
end

# Root crumb 第三階層 ’メルカリ＞ブランド一覧＞ブランド名’
crumb :brand do |brand|
  link "ブランド名"
  #brand.name, brands_path
  parent:brand
end

# Root crumb 第二階層 ’メルカリ＞検索キーワード’
crumb :product do |product|
  link "入力した検索キーワード"
  # keyword, products_path
  parent:root
end

# Root crumb 第二階層 ’メルカリ＞マイページ’
crumb :mypage do
  link "マイページ"
  #, mypage_path
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞プロフィール’
crumb :profile do
  link "プロフィール", profile_path
  parent :mypage
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞やることリスト’
crumb :remainds do
  link "やることリスト", reminds_path
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞お知らせ’
crumb :notification do
  link "お知らせ", notification_path
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞いいね一覧’
crumb :likes do
  link "いいね一覧", likes_path
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞出品した商品 - 出品中’
crumb :products_for_sale do
  link "出品した商品 - 出品中"
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞出品した商品 - 取引中’
crumb :products_in_trade do
  link "出品した商品 - 取引中"
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞出品した商品 - 売却済み’
crumb :products_sold do
  link "出品した商品 - 売却済み"
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞購入した商品 - 取引中’
crumb :purchased_in_trade do
  link "購入した商品 - 取引中"
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞ 購入した商品 - 過去の取引’
crumb :purchased do
  link "購入した商品 - 過去の取引"
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞評価一覧’
crumb :reports do
  link "評価一覧", reports_path
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞お問合せ’
crumb :support do
  link "お問合せ", support_path
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞売上申請’
crumb :sales_applications do
  link "売上・振込申請", sales_applications_path
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞ポイント’
crumb :points do
  link "ポイント", points_path
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞プロフィール’
crumb :profiles do
  link "プロフィール", profiles_path
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞発送元・お届け先住所変更’
crumb :regions do
  link "発送元・お届け先住所変更", regions_path
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞支払い方法’
crumb :credit_cards do
  link "クレジットカードを追加"
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞メール/パスワード’
crumb :mail_password do
  link "メール/パスワード"
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞本人情報の登録’
crumb :registrations do
  link "本人情報の登録"
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞電話番号の確認’
crumb :sms_authentications do
  link "電話番号の確認"
  parent :users
end

# Root crumb 第三階層 ’メルカリ＞マイページ＞ログアウト’
crumb :logout do
  link "ログアウト"
  parent :users
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
