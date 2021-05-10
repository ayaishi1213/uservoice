class Post < ApplicationRecord
  with_options presence: true do
    validates :item
    validates :content
  end

  belongs_to :user
  
end
