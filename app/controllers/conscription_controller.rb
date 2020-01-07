class ConscriptionController < ApplicationController
  def update
    command = Command.find_or_initialize_by(command_params.merge(dummy_user))
    command.command_type = Command::CONSCRIPTION
    command.save
    redirect_to home_index_url
  end

  private

  def dummy_user
    { user_id: 1 }
  end

  def command_params
    params.permit(:command_no)
  end

  def conscription_command_params
    params.require(:conscription_command).permit(:soldier_type, :soldier_num)
  end
end
