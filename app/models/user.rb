class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :posts, through: :profile, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'invalid email address'
  }
end
