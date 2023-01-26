class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :username, presence: true, uniqueness: true,
                       length: {
                         in: 3..10,
                         wrong_length: 'must be between 3 and 10 characters'
                       },
                       format: {
                         with: /[^-\s]/,
                         message: "doesn't allow spaces"
                       }
end
