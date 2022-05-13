class QuestionHashtag < ApplicationRecord
  belongs_to :question
  belongs_to :hashtag

  def self.tag_present(question_id, tag_name)
    joins(:question, :hashtag).where(question_id: question_id).where('hashtags.name': tag_name).any?
  end
end
