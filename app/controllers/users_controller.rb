class UsersController < ApplicationController
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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path, notice: 'Your profile data has been updated!'
    else
      flash.now[:alert] = 'An error occurred during saving!'

      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: 'User has been deleted!'
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email, :password, :password_confirmation
    )
  end
end
