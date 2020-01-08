class HomeController < ApplicationController
  def index
    @user = User.find(dummy_user[:id])
    @commands = Command.where(user_id: dummy_user[:id]).order(:command_no)

    gon.command_map = {
      Command::CONSCRIPTION => { action: conscription_form_path, method: 'GET' }
    }
  end
end
