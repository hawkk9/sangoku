module Skills
  class HoheiSkill < Skills::BaseSkill
    BATTLING_EFFECTS = [{
                 level: 1,
                 effect: Proc.new do |user, opponent_user|
                   odds = user.charm / 14
                   if rand(1..100) <= odds
                     damage = rand(1..6)
                     opponent_user.soldier.num -= damage
                     Message::MessageWriter.message(
                       "【強行軍】#{user.name}の強行軍！" \
            "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier.num}人 ↓(-#{damage})"
                     )
                   end
                 end,
                 conditions: []
               }]
  end
end
