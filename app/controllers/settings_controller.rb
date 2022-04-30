class SettingsController < ApplicationController
  before_action :set_setting, only: %i[edit update destroy]

  def new
    @setting = Setting.new
  end

  def create
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

  def setting_params
    params.require(:setting).permit(:navbar_color, :user_id)
  end

  def set_setting
    @setting = Setting.find(params[:id])
  end
end
