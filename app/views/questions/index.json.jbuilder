json.questions @questions do |question|
  json.id question.id
  json.url question_url(question)
  json.title question.title
  json.language question.language
  # json.authors question.authors do |author|
  #   json.id author.id
  #   json.url author_url(author)
  #   json.name author.name
  # Will use the previous code later for users and tags
  end
