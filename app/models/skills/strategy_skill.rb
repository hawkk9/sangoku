module Skills
  class StrategySkill < Skills::BaseSkill
    EFFECTS = [{
      level: 1,
      effect: Proc.new do |user, opponent_user|
        odds = (user.intelligence + user.charm) / 11
        if rand(1..100) <= odds
          damage = rand(1..7)
          opponent_user.soldier_num -= damage
          Message::MessageWriter.message(
            "【罠】#{user.name}が落とし穴を仕掛けました。" \
            "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier_num}人 ↓(-#{damage})"
          )
        end
      end,
      timings: [DEFENCE]
    },
    {
      level: 2,
      effect: Proc.new do |user, opponent_user|
        odds = (user.intelligence + user.charm) / 14
        if rand(1..100) <= odds
          recovery = rand(1..5)
          user.max_damage += 1
          user.soldier_num += recovery
          Message::MessageWriter.message(
            "【援軍】#{user.name}に援軍が到着しました。味方の攻撃力が上昇しました。" \
            "#{user.name} (最大ダメージ＝#{user.max_damage})#{opponent_user.soldier.name_with_rank} #{opponent_user.soldier_num}人 ↑(+#{recovery})" \
          )
        end
      end,
      timings: [DEFENCE]
    },
    {
      level: 3,
      effect: Proc.new do |user, opponent_user|
        odds = (user.intelligence + user.charm) / 13
        if rand(1..100) <= odds
          damage = rand(1..5)
          opponent_user.soldier_num -= damage
          opponent_user.max_damage -= 1
          Message::MessageWriter.message(
            "【罠】#{user.name}が水攻めを仕掛けました。敵軍の攻撃力が低下しました。" \
           "#{opponent_user.name} (最大ダメージ＝#{opponent_user.max_damage}) #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier_num}人 ↓(-#{damage})"
          )
        end
      end,
      timings: [DEFENCE]
    }]
  end
end
