class WarController < ApplicationController
  include InputCommand

  def form
    @command_nos = params[:command_no]
    @towns = Town.all
    @user = User.find(dummy_user_id)
  end

  def update
    # input_commands_and_redirect
    redirect_to home_index_url
  end
end
