class Comment < ApplicationRecord
  with_options presence: true do
    validates :comment_content
  end

  belongs_to :user
  belongs_to :post
end
