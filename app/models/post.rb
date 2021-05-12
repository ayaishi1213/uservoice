class Post < ApplicationRecord
  with_options presence: true do
    validates :item
    validates :content
    validates :image
  end

  belongs_to :user
  has_one_attached :image
  has_many :likes
  has_many :users, through: :likes

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
