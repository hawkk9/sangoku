class ConscriptionController < ApplicationController
  include InputCommand

  def form
    @command_nos = params[:command_no]
    @user = User.find(dummy_user_id)
    @soldiers = Soldiers::Soldier.can_employ_soldiers(@user)
  end

  def update
    input_command_to_nos
  end

  private

  def conscription_command_params
    params.permit(:soldier_type, :soldier_num)
  end

  def input_command(command_no)
    command = Command.find_or_initialize_by({command_no: command_no}.merge({user_id: dummy_user_id}))
    command.command_type = Command::CONSCRIPTION
    command.save
    if command.conscription_command.nil?
      command.create_conscription_command(conscription_command_params)
    else
      command.conscription_command.update_attributes(conscription_command_params)
    end
  end
end
