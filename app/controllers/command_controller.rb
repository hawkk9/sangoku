class CommandController < ApplicationController
  include InputCommand

  def update
    input_command_to_nos
  end

  private

  def input_command(command_no)
    command = Command.find_or_initialize_by({command_no: command_no}.merge({user_id: dummy_user[:id]}))
    command.command_type = params[:command_type]
    command.save
  end
end
