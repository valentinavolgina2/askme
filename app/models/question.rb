class Question < ApplicationRecord
  VALID_HASHTAG_REGEX = /#[[:word:]-]+/

  validates :body, presence: true, length: { maximum: 280 }

  belongs_to :user
  belongs_to :author, optional: true, class_name: 'User', foreign_key: :author_id

  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags

  after_save_commit :create_hashtags

  private

  def create_hashtags
    self.hashtags = extract_hashtags(body + " " + answer).map { |tag| Hashtag.find_or_create_by(name: tag.downcase) }.uniq
  end

  def extract_hashtags(text)
    text.scan(VALID_HASHTAG_REGEX).map{ |name| name.gsub("#", "") }
  end
end
