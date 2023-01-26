class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :username, presence: true, uniqueness: true,
                       length: {
                         in: 3..20,
                         wrong_length: 'must be between 3 and 20 characters'
                       },
                       format: {
                         with: /\A[a-z\d]*\Z/i,
                         message: "allows only numbers and letters"
                       }
end
