class Group < ApplicationRecord
  has_many :group
  has_many :users, through: :group_users

  validates :neme, presence: true
  validates :introduction, presence: true
  attachment :image, destroy: false
end
