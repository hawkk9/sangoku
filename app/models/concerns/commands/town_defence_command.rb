module Commands
  class TownDefenceCommand
    CONTRIBUTING = 30

    def execute(user)
      messages = []

      town_defences = TownDefence.where(town: user.town).order(:order)
      town_defence = town_defences.find_or_initialize_by(user: user)
      town_defence.town = user.town
      min_order = town_defences.where.not(user: user).minimum(:order)
      town_defence.order = min_order.nil? ? 0 : min_order - 1
      town_defence.save

      messages << Message::MessageWriter.message("守備につきました貢献値+#{CONTRIBUTING}。")
      Message::MessageWriter.write_user_log_file(user, messages)
    end
  end
end