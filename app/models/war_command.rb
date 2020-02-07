class WarCommand < ApplicationRecord
  enum mode: {
   siege: 0, development: 1, gossip: 2,
   ambush:3, assault: 4,
  }

  belongs_to :command
  belongs_to :town

  def execute
    attack_user = self.command.user

    # while
    defence_user = self.town.town_defences.order(:order).first.user
    battle = defence_user.nil? ? Battle::WallBattle.new(attack_user) : Battle::UsersBattle.new(attack_user, defence_user, self.mode)
    battle.handle
    self.write_map_messages(attack_user, defence_user)
    # end
  end

  def write_map_messages(attack_user, defence_user)
    map_messages = []
    map_messages << Message::MessageWriter.message("#{attack_user.country.name}の#{attack_user.name}は#{self.town.name}（#{self.town.country.name}）へ攻め込みました！")
    if attack_user.is_win?
      map_messages << Message::MessageWriter.message("<font color='blue'>【勝利】</font>#{attack_user.name}は#{defence_user.name}を倒しました！")
      map_messages << Message::MessageWriter.message("#{defence_user.name}『負け！』 #{attack_user.name}『勝ち！』")
    else
      map_messages << Message::MessageWriter.message("<font color='red'>【敗北】</font>#{attack_user.name}は#{defence_user.name}に敗北した。。")
      map_messages << Message::MessageWriter.message("#{defence_user.name}『勝ち！』 #{attack_user.name}『負け！』")
    end
    Message::MessageWriter.write_map_log_file(map_messages.reverse)
  end

  def inputed_label
    "#{self.town.name}へ出兵"
  end
end
