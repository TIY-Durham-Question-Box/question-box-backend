class QuestionsController < ApplicationController
  before_action :authenticate, except: [:index]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    # save the user in the question too
    @question.user = current_user
    if @question.save
      render json: { message: "created" }, status: :created
    else
      render json: {
        errors: @question.errors
      }, status: :bad_request
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    render json: {deleted: true}
  end

  private

 def question_params
   params.require(:question).permit(:title, :body, :language)
 end


end
