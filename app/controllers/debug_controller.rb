class DebugController < ApplicationController
  def execute_command
    CommandWorker.perform_async(dummy_user[:id])
    redirect_to home_index_url
  end
end