class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :messages, dependent: :destroy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :name, :image, presence: true
  validates :user_ids, length: { minimum: 2 , message: 'を1人以上選択してください'}
  validates :category_id, numericality: { other_than: 1 , message: 'を選択してください'} 
end
