class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    if logged_in?
      @question = Question.new
    else
      redirect_to root_path
    end
  end

  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      @tags = tag_params.to_a.flatten
      unless @tags.empty?
        @tags[1].gsub(/\W+/, ' ').split(' ').each do |tag|
          @tag = Tag.find_by(title: tag)
          if @tag
            @tag.question_tags.create(question: @question)
          else
            @new_tag = Tag.create(title: tag).question_tags.create(question: @question)
          end
        end
      end

      redirect_to questions_path
    else
      @errors = @question.errors.full_messages.join(', ')
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
    params.require(:question).permit(:title, :content)
  end

  def tag_params
    params.require(:question).permit(:new_tags)
  end
end
