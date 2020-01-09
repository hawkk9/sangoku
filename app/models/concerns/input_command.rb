module InputCommand
  def input_command_to_nos
    if params[:command_no].first == Command::ALL
      Command::MAX_NUM.times { |command_no| input_command(command_no) }
    else
      params[:command_no].each { |command_no| input_command(command_no) }
    end

    redirect_to home_index_url
  end
end
