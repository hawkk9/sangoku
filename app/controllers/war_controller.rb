class WarController < ApplicationController
  include InputCommand

  def form
    @command_nos = params[:command_no]
    @towns = Town.all
    @user = User.find(dummy_user_id)
  end

  def update
    input_commands_and_redirect
  end

  def war_command_params
    params.permit(:mode, :town_id)
  end

  def input_command(command_no)
    command = Command.find_or_initialize_by({command_no: command_no}.merge({user_id: dummy_user_id}))
    command.command_type = Command::WAR
    command.save
    if command.war_command.nil?
      command.create_war_command(war_command_params)
    else
      command.war_command.update_attributes(war_command_params)
    end
  end

end
