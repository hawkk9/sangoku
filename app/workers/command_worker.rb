class CommandWorker
  include Sidekiq::Worker

  def perform(user_id)
    command = Command.where(user_id: user_id).order(:command_no).first
    command.execute
  end
end
