class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '------' },
    { id: 2, name: '家族' },
    { id: 3, name: '仕事' },
    { id: 4, name: '友達' },
    { id: 5, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :groups
  end