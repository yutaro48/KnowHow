class Users::SessionsController < Devise::SessionsController
  def guest_login
    user = User.find_guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end