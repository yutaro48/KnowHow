class ApplicationController < ActionController::Base
  def current_user
    ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    super
  end

  def after_sign_up_path_for(resource)
    posts_path(resource)
  end

  def after_sign_in_path_for(resource)
    posts_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path(resource)
  end
end
