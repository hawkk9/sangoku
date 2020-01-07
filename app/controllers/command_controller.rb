class CommandController < ApplicationController
  def form
    @command = Command.find_or_initialize_by(command_params.merge(dummy_user))
  end

  def command_params
    params.permit(:command_no)
  end
end
