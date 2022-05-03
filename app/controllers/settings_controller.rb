class SettingsController < ApplicationController
  before_action :ensure_current_user, only: %i[create update destroy edit new]
  before_action :set_setting, only: %i[edit update destroy]

  def new
    @user = User.find(params[:user_id])
    @setting = Setting.new(user: @user)
  end

  def create
    setting_params = params.require(:setting).permit(:navbar_color, :user_id)
    @setting = Setting.new(setting_params)

    if @setting.save
      redirect_to root_path, notice: 'Settings have been created!'
    else
      flash.now[:alert] = 'Some of the fields are incorrect!'

      render :new
    end
  end

  def edit
  end

  def update
    setting_params = params.require(:setting).permit(:navbar_color)

    @setting = Setting.find(params[:id])

    if @setting.update(setting_params)
      redirect_to root_path, notice: 'Settings have been updated!'
    else
      flash.now[:alert] = 'An error occurred during saving!'

      render :edit
    end
  end

  def destroy
    @setting.destroy

    redirect_to root_path, notice: 'Settings have been deleted!'
  end

  private

  def ensure_current_user
    redirect_with_alert unless current_user.present?
  end

  def set_setting
    @setting = Setting.find(params[:id])
  end
end
