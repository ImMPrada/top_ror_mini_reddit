class Comment < ApplicationRecord
  belongs_to :profile
  belongs_to :post

  validates :content, presence: true
end
