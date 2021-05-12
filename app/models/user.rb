class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname
    validates :age
  end
  
  has_many :posts
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
end
