class SizeType < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    {id: 1, size_type: '大人服'},
    {id: 2, size_type: '子供服'},
    {id: 3, size_type: '大人靴'},
    {id: 4, size_type: '子供靴'}
  ]
end
