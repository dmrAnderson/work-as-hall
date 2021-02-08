# email:string
# password_digest:string
#
# password:string virtual
# password_confimation:string virtual

class User < ApplicationRecord
  has_secure_password

  has_many :twitter_accounts, dependent: :destroy
  has_many :tweets, dependent: :destroy

  validates :email, presence: true,
                    format: {
                      with: /\A[^@\s]+@[^@\s]+\z/,
                      message: 'must be a valid email address'
                    }
end
