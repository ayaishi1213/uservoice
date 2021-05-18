class Post < ApplicationRecord
  with_options presence: true do
    validates :item
    validates :content
    validates :image
  end

  belongs_to :user
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :comments, dependent: :destroy

end
