class AnswersController < ApplicationController
before_action :authenticate, except: [:index, :show]

  def index
    @question = Question.find(params[:question_id])
  end

  def show
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def create
    # create a new answer and make the current user the "owner" of that answer
    answer = Answer.new(answer_params)
    answer.user = current_user
    answer.question_id = params[:question_id]
    if answer.save
      render json: {answer: answer}, status: :created
    else
      render json: { errors: answer.errors }
    end
  end

  def update
    question = Question.find(params[:question_id])
    # verify that the person who created the question is the one trying to mark best
    if question.user == current_user
        answer = Answer.find(params[:id])
        if answer.update(best: answer_params[:best])
          render json: {answer: answer}, status: :ok
        else
          render json: { errors: answer.errors }
        end
    else
        render json: {errors: "Only the question submittor can mark an answer best"}, status: :forbidden
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    render json: {deleted: true}
  end

  private

  def answer_params
   params.require(:answer).permit(:body, :best, :question_id)
  end


end
