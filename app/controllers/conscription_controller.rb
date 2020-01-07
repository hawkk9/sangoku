class ConscriptionController < ApplicationController
  def update
    params[:command_no].each do |command_no|
      command = Command.find_or_initialize_by({command_no: command_no}.merge({user_id: dummy_user[:id]}))
      command.command_type = Command::CONSCRIPTION
      command.save
      if command.conscription_command.nil?
        command.create_conscription_command(conscription_command_params)
      else
        command.conscription_command.update_attributes(conscription_command_params)
      end
    end
    redirect_to home_index_url
  end

  private

  def conscription_command_params
    params.permit(:soldier_type, :soldier_num)
  end
end
