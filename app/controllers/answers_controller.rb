class AnswersController < ApplicationController
before_action :authenticate, except: [:index, :show]

  def index
    # question_answers GET    /questions/:question_id/answers(.:format)     answers#index
    @question = Question.find(params[:question_id])
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])

  end

  def create
    # @answer = @question.answers.build(answer_params)
    # @answer.user = current_user
    # if @answer.save ...
    answer = Answer.new(answer_params)
    answer.question_id = params[:question_id]
    answer.save
    render json: { message: "created" }, status: :created
  end

  private

  def answer_params
   params.require(:answer).permit(:body, :question_id)
  end


end
