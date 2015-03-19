class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    # if logged_in?
      @question = Question.new
    # else
    #   redirect_to root_path
    # end
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      redirect_to questions_path
    else
      @errors = @post.errors.full_message.join(', ')
      render :new
    end
  end

  def show
    @question = Question.find_by(id: params[:id])
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private

  def question_params
    puts params
    params.require(:question).permit(:title, :content)
  end
end
