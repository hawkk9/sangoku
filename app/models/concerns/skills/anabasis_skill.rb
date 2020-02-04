module Skills
  class AnabasisSkill < Skills::BaseSkill
    BATTLING_EFFECTS = [{
                 level: 1,
                 effect: Proc.new do |user, opponent_user|
                   odds = user.strength / 10
                   if rand(1..100) <= odds
                     damage = rand(1..5)
                     Message::MessageWriter.message(
                       "【突貫】#{user.name}が突貫を仕掛けました。" \
            "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier_num}人 ↓(-#{damage})"
                     )
                   end
                 end,
                 conditions: [CONDITIONS[:attack]]
               },
               {
                 level: 2,
                 effect: Proc.new do |user, opponent_user|
                   odds = user.strength / 11
                   if rand(1..100) <= odds
                     Message::MessageWriter.message(
                       "【食事】#{user.name}の最大ダメージが1上昇しました！(#{user.name}の最大ダメージ＝#{user.battle_param.max_damage})"
                     )
                   end
                 end,
                 conditions: [CONDITIONS[:attack]]
               },
               {
                 level: 3,
                 effect: Proc.new do |user, opponent_user|
                   odds = user.strength / 14
                   if rand(1..100) <= odds
                     user.battle_param.damage = user.battle_param.damage * 2
                     Message::MessageWriter.message(
                       "【正拳突き】#{user.name}の正拳突き！"
                     )
                   end
                 end,
                 conditions: [CONDITIONS[:attack]]
               }]
  end
end
