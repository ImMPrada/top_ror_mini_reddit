class Post < ApplicationRecord
  belongs_to :profile
  has_many :comments, dependent: :destroy

  validates :content, presence: true
end
