class HomeController < ApplicationController
  def index
    @user = User.find(dummy_user_id)
    @commands = Command.includes(:user, :conscription_command)
                  .where(user_id: dummy_user_id).order(:command_no).to_a

    gon.command_map = {
      Command::CONSCRIPTION => { action: conscription_form_path, method: 'GET' }
    }
  end
end
