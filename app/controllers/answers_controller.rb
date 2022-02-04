class AnswersController < ApplicationController

  def index; end

  def show; end

  def new; end

  def create
    question = Question.find(params[:question_id])
    @answer = question.answers.new(answers_params)

    if @answer.save
      redirect_to question_answers_path
    else
      render :new
    end
  end
  
  def edit; end

  def update; end

  def destroy; end

  private

  def answers_params
    params.require(:answer).permit(:body)
  end

end
