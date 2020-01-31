module Skills
  class BanditSkill < Skills::BaseSkill
    EFFECTS = [{
      level: 3,
      effect: Proc.new do |battle_param, opponent_battle_param|
        user = battle_param.user
        need_down_num = (2100 / user.intelligence) + 3
        if battle_param.down_num >= need_down_num
          battle_param.down_num = 0
          user.max_damage += rand(1..3)
          Message::MessageWriter.message(
            "【屍拾い】#{user.name}の最大ダメージが上昇しました！(#{user.name}の最大ダメージ＝#{user.max_damage})" \
        )
        end
      end,
      timings: [BATTLING]
    }]
  end
end
