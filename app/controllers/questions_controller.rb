class QuestionsController < ApplicationController
  before_action :authenticate, except: [:index]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.create(question_params)
    render :show, status: :created
  end

  private

 def question_params
   params.require(:question).permit(:title, :body, :language)
 end


end
