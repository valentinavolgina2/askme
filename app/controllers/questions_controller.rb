class QuestionsController < ApplicationController
  before_action :ensure_current_user, only: %i[update destroy edit hide]
  before_action :set_question_for_current_user, only: %i[update destroy edit hide]
  before_action :set_recently_joined_users, only: %i[index search]
  before_action :set_hashtags, only: %i[index search]

  def create
    question_params = params.require(:question).permit(:body, :user_id)

    @question = Question.new(question_params)
    @question.author = current_user

    if @question.save
      redirect_to user_path(@question.user), notice: 'Created a new question!'
    else
      flash.now[:alert] = 'Some of the fields are incorrect!'

      render :new
    end
  end

  def update
    question_params = params.require(:question).permit(:body, :answer)

    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to user_path(@question.user), notice: 'Saved the question!'
    else
      flash.now[:alert] = 'Some of the fields are incorrect!'

      render :edit
    end
  end

  def destroy
    @user = @question.user
    @question.destroy

    redirect_to user_path(@user), notice: 'Question has been deleted!'
  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.order(created_at: :desc).last(10)
  end

  def new
    @user = User.find(params[:user_id])
    @question = Question.new(user: @user)
  end

  def edit
  end

  def hide
    @question.toggle!(:hidden)

    redirect_to question_path(@question)
  end

  def search
    tag  = params[:tag]
    @questions = Question.joins(:hashtags).where(hashtags: {name: tag})

    render :index
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_question_for_current_user
    @question = current_user.questions.find(params[:id])
  end

  def set_recently_joined_users
    @users = User.order(created_at: :desc).last(10)
  end

  def set_hashtags
    @hashtags = Hashtag.distinct.order(name: :asc).pluck(:name)
  end
end
