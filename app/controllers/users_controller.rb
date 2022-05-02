class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      redirect_to root_path, notice: 'You have registered on AskMe!'
    else
      flash.now[:alert] = 'Some of the fields are incorrect!'

      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'Your profile data has been updated!'
    else
      flash.now[:alert] = 'An error occurred during saving!'

      render :edit
    end
  end

  def destroy
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: 'User has been deleted!'
  end

  def show
    @questions = @user.questions
    @question = Question.new(user: @user)
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password, :password_confirmation
    )
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user
    redirect_with_alert unless current_user == @user
  end
end
