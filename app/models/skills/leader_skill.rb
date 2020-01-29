module Skills
  class LeaderSkill < Skills::BaseSkill
    EFFECTS = [{
      level: 3,
      effect: Proc.new do |user, opponent_user|
        odds = (user.intelligence + user.charm) / 11
        if rand(1..100) <= odds
          damage = rand(1..5)
          opponent_user.soldier_num -= damage
          user.soldier_num += damage
          Message::MessageWriter.message(
            "【洗脳】#{user.name}が#{opponent_user.name}の兵を洗脳しました。" \
            "#{opponent_user.name} #{opponent_user.soldier_num}人 ↓(-#{damage}) #{user.name} #{user.soldier_num}人 ↑(+#{damage})" \
          )
        end
      end,
      timings: []
    }]
  end
end
