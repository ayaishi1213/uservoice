class Post < ApplicationRecord
  with_options presence: true do
    validates :item
    validates :content
    validates :image
  end

  belongs_to :user
  has_one_attached :image
end
