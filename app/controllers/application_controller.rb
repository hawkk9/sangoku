class ApplicationController < ActionController::Base
  def dummy_user_id
    session[:user_id] || 1
  end
end
