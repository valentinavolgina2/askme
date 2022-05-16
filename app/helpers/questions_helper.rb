module QuestionsHelper
  def replace_tags_with_links(text)
    text.gsub(Hashtag::VALID_HASHTAG_REGEX) { |tag| link_to tag, search_questions_path(tag: tag.sub('#','').downcase) }
  end
end
