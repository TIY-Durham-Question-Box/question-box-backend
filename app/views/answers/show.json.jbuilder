json.question do
  json.id @question.id
  json.url question_url(@question)
  json.title @question.title
  # json.answers @question.answers do |answer|
    json.body @answer.body
    # json.url author_url(author)
    json.name @author
  # end
end
