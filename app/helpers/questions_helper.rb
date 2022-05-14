module QuestionsHelper
  VALID_HASHTAG_REGEX = /#[[:word:]-]+/

  def replace_tags_with_links(text)
    text.gsub(VALID_HASHTAG_REGEX) { |tag| link_to tag, search_questions_path(tag: tag.sub('#','')) }
  end
end
