class Question < ApplicationRecord
  validates :body, presence: true, length: { maximum: 280 }

  belongs_to :user
  belongs_to :author, optional: true, class_name: 'User', foreign_key: :author_id

  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags

  after_commit :create_hashtags, on: [:create, :update]

  private

  def create_hashtags
    all_hashtags = extract_hashtags(body) | extract_hashtags(answer)

    all_hashtags.each do |name|
      hashtags.create(name: name.downcase) unless hashtags.exists?(name: name.downcase)
    end
  end

  def extract_hashtags(text)
    text.to_s.scan(/#[[:word:]-]+/).map{ |name| name.gsub("#", "") }.reject{ |str| str.nil? || str.strip.empty? }
  end
end
