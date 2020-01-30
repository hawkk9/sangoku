module Skills
  class BanditSkill < Skills::BaseSkill
    EFFECTS = [{
      level: 3,
      effect: Proc.new do |user, opponent_user|
        user.max_damage += rand(1..3)
        Message::MessageWriter.message(
          "【屍拾い】#{user.name}の最大ダメージが上昇しました！(#{user.name}の最大ダメージ＝#{user.max_damage})" \
        )
      end,
      timings: [BATTLING]
    }]
  end
end
