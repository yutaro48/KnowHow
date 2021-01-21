class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: [:update, :destroy]
  
  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to posts_path, alert: 'ゲストユーザの編集・削除はできません。'
    end
  end
  
end