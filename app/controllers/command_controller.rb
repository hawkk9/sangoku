class CommandController < ApplicationController
  def form
    @command_nos = params[:command_no]
  end
end
