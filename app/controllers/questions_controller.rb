class QuestionsController < ApplicationController
  
  def new
    @question = Question.new
  end
  
  def create
    @question = Question.new(params[:question])
    if @question.save
      flash[:notice] = 'Questão cadastrada com sucesso'
      redirect_to root_url
    end
  end
end
