class Condition < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    {id: 1, condition: '新品・未使用'},
    {id: 2, condition: '未使用に近い'},
    {id: 3, condition: '目立った傷汚れなし'},
    {id: 4, condition: 'やや傷や汚れ'},
    {id: 5, condition: '傷や汚れあり'},
    {id: 6, condition: '全体的に状態が悪い'}
  ]
end
