class ConscriptionController < ApplicationController
  def update
    command = Command.find_or_initialize_by(command_params.merge(dummy_user))
    command.command_type = Command::CONSCRIPTION
    command.save
    if command.conscription_command.nil?
      command.create_conscription_command(conscription_command_params)
    else
      command.conscription_command.update_attributes(conscription_command_params)
    end
    redirect_to home_index_url
  end

  private

  def command_params
    params.permit(:command_no)
  end

  def conscription_command_params
    params.permit(:soldier_type, :soldier_num)
  end
end
