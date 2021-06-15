class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  has_many :messages, dependent: :destroy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :name, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1 } 
end
