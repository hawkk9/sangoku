class WarCommand < ApplicationRecord
  enum mode: {
   siege: 0, development: 1, gossip: 2,
   yasyu:3, kyousyu: 4,
  }

  belongs_to :command
  belongs_to :town

  def execute
    attack_user = Battle::AttackUser.new(
      self.command.user,
      self.mode
    )

    # while
    user = self.town.town_defences.order(:order).first.user
    if user.present?
      defence_user = Battle::DefenceUser.new(
        user
      )
      battle = Battle::UsersBattle.new(attack_user, defence_user)
    else
      battle = Battle::WallBattle.new(attack_user)
    end
    battle.start
    self.write_map_messages(attack_user)
    # end
  end

  def write_map_messages(attack_user)
    map_messages = []
    map_messages << Message::MessageWriter.message(
      "#{attack_user.country.name}の#{attack_user.name}は" \
      "#{self.town.name}（#{self.town.country.name}）へ攻め込みました！"
    )
    Message::MessageWriter.write_map_log_file(map_messages.reverse)
  end

  def inputed_label
    "#{self.town.name}へ出兵"
  end
end
