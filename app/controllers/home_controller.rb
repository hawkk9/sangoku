class HomeController < ApplicationController
  def index
    @user = User.find(dummy_user[:id])
    @commands = Command.where(user_id: dummy_user[:id])
  end
end
