class DebugController < ApplicationController
  def execute_command
    command = Command.where(user_id: dummy_user_id).order(:command_no).first
    command.execute

    Game.step

    redirect_to home_index_url
  end

  def change_user
    session[:user_id] = params[:id]
    redirect_to home_index_url
  end
end