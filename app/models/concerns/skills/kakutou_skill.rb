module Skills
  class KakutouSkill < Skills::BaseSkill
    BATTLING_EFFECTS = [{
                 level: 1,
                 effect: Proc.new do |user, opponent_user|
                   odds = user.strength / 10
                   if rand(1..100) <= odds
                     min_damage = user.battle_param.max_damage / 2
                     user.battle_param.damage = [user.battle_param.damage, min_damage].max
                     Message::MessageWriter.message(
                       "【会心の一撃】#{user.name}の会心の一撃！"
                     )
                   end
                 end,
                 conditions: []
               },
               {
                 level: 2,
                 effect: Proc.new do |user, opponent_user|
                   odds = user.strength / 11
                   if rand(1..100) <= odds
                     user.battle_param.max_damage += rand(1..2)
                     Message::MessageWriter.message(
                       "【気合いため】#{user.name}の最大ダメージが上昇しました！(#{user.name}の最大ダメージ＝#{user.battle_param.max_damage})"
                     )
                   end
                 end,
                 conditions: []
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
                 conditions: []
               }]
  end
end
