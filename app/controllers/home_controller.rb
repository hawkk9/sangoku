class HomeController < ApplicationController
  def index
    @user = User.first
    @commands = Command.all
  end
end
