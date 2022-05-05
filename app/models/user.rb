class User < ApplicationRecord
  VALID_NICKNAME_REGEX = /\A[0-9a-z_]+\z/

  has_secure_password

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates_with EmailAddress::ActiveRecordValidator, field: :email
  validates :nickname, uniqueness: true, presence: true, length: { maximum: 40 },
            format: { with: VALID_NICKNAME_REGEX }

  has_many :questions, dependent: :delete_all
  has_many :owned_questions, class_name: 'Question', foreign_key: :author_id, dependent: :delete_all

  has_one :setting

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'robohash')

  def to_param  # overridden
    nickname
  end

  def downcase_nickname
    nickname.downcase!
  end
end
