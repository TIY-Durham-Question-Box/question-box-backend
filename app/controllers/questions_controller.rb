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
    @question.user = current_user
    # byebug
    # @user.save
    if @question.save
      render json: { message: "created" }, status: :created
    else
      render json: {
        errors: @question.errors
      }, status: :bad_request
    end


    # @question = Question.create(question_params)
    # render json: { message: "created" }, status: :created
    # render :show, status: :created
  end

  private

 def question_params
   params.require(:question).permit(:title, :body, :language)
 end


end
