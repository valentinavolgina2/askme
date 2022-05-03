class Question < ApplicationRecord
  validates :body, presence: true, length: { maximum: 280 }

  belongs_to :user
  belongs_to :author, optional: true, class_name: 'User', foreign_key: :author_id
end
