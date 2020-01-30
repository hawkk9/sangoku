module Skills
  class InfantrySkill < Skills::BaseSkill
    EFFECTS = [{
      level: 1,
      effect: Proc.new do |user, opponent_user|
        odds = user.charm / 11
        if rand(1..100) <= odds
          damage = rand(1..4)
          opponent_user.soldier_num -= damage
          Message::MessageWriter.message(
            "【一斉射撃】#{user.name}の一斉射撃！" \
            "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier_num}人 ↓(-#{damage})"
          )
        end
      end,
      timings: []
    }]
  end
end
