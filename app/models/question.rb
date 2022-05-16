class Question < ApplicationRecord
  validates :body, presence: true, length: { maximum: 280 }

  belongs_to :user
  belongs_to :author, optional: true, class_name: 'User', foreign_key: :author_id

  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags

  after_save_commit :create_hashtags

  private

  def create_hashtags
    self.hashtags = extract_hashtags("#{body} #{answer || ""}").map { |tag| Hashtag.create_or_find_by(name: tag.gsub("#", "")) }
  end

  def extract_hashtags(text)
    text.downcase.scan(Hashtag::VALID_HASHTAG_REGEX).uniq
  end
end
