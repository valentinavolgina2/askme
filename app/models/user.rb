class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates_with EmailAddress::ActiveRecordValidator, field: :email
  validates :nickname, uniqueness: true, presence: true, length: { maximum: 40 },
            format: { with: /\A[0-9a-z_]+\z/, message: 'only allows Latin characters, numbers, and underscore' }

  def downcase_nickname
    nickname.downcase!
  end
end
