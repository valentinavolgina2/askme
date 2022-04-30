class User < ApplicationRecord
  VALID_NICKNAME_REGEX = /\A[0-9a-z_]+\z/

  has_secure_password

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates_with EmailAddress::ActiveRecordValidator, field: :email
  validates :nickname, uniqueness: true, presence: true, length: { maximum: 40 },
            format: { with: VALID_NICKNAME_REGEX }

  def downcase_nickname
    nickname.downcase!
  end

  def settings
    Setting.find_by(user_id: id)
  end
end
