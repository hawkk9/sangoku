class ApplicationController < ActionController::Base
  private

  def dummy_user
    { user_id: 1 }
  end
end
