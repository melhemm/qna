class AnswersController < ApplicationController
  before_action :set_answer, only: %i[show]
  before_action :set_question, only: %i[create show]

  def index; end

  def show; end

  def new; end

  def create
    @answer = @question.answers.new(answers_params)

    if @answer.save
      redirect_to @question
    else
      render :new
    end
  end
  
  def edit; end

  def update; end

  def destroy; end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def answers_params
    params.require(:answer).permit(:body)
  end

end
