module Skills
  class AgitationSkill < Skills::BaseSkill
    EFFECTS = [{
                 level: 1,
                 effect: Proc.new do |user, opponent_user|
                   odds = user.charm / 11
                   if rand(1..100) <= odds
                     user.battle_param.max_damage += 1
                     Message::MessageWriter.message(
                       "【鼓舞】#{user.name}の最大ダメージが上昇しました！(#{user.name}の最大ダメージ＝#{user.battle_param.max_damage})"
                     )
                   end
                 end,
                 conditions: []
               }]
  end
end
