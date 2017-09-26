json.question do
  json.id @question.id
  json.url question_url(@question)
  json.title @question.title
  json.body @question.body
  json.language @question.language
  # json.authors @question.authors do |author|
  #   json.id author.id
  #   json.url author_url(author)
  #   json.name author.name
  # end
  # Will use the above later for users and tags
end
