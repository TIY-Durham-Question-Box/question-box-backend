class AnswersController < ApplicationController

  def show
    @answer = Answer.find(params[:id])
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.question_id = params[:answer][:question_id]
    @answer.save
    render :show, status: :created
  end

  private

  def answer_params
   params.require(:answer).permit(:body)
  end


end
