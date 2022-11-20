class ApplicationController < ActionController::Base
  # before_action :user_is_active

  def user_is_active
    return if current_user.nil?

    if current_user.finished_account == true
      redirect_to root_path 
    end
  end
end
