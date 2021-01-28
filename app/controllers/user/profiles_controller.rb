class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_guest, only: [:update]

  def edit
    @profile = current_user.prepare_profile
  end

  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to outputs_path, notice: '更新しました。'
    else
      flash.now[:error] = '更新できませんでした。'
      render :edit
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :gender, :join, :birthday, :phone, :mail, :avatar)
  end

  def check_guest
    if current_user.email == 'guest@example.com'
      redirect_to outputs_path, alert: 'ゲストユーザの編集はできません。'
    end
  end

end