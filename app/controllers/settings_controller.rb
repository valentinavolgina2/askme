class SettingsController < ApplicationController
  before_action :set_setting, only: %i[edit update destroy]

  def new
    @setting = Setting.new
    @setting.navbar_color = navbar_color
  end

  def create
    Setting.create(setting_params)

    redirect_to root_path, notice: 'Settings have been created!'
  end

  def edit
  end

  def update
    @setting.update(setting_params)

    redirect_to root_path, notice: 'Settings have been updated!'
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
