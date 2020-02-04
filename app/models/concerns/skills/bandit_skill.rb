module Skills
  class BanditSkill < Skills::BaseSkill
    BEFORE_BATTLE_EFFECTS = [
      {
        level: 2,
        effect: Proc.new do |user, opponent_user|
        end,
        conditions: [CONDITIONS[:attack]]
      }
    ]
    BATTLING_EFFECTS = [
      {
        level: 3,
        effect: Proc.new do |user, opponent_user|
          need_down_num = (2100 / user.intelligence) + 3
          if user.battle_param.down_num >= need_down_num
            user.battle_param.down_num = 0
            user.battle_param.max_damage += rand(1..3)
            Message::MessageWriter.message(
              "【屍拾い】#{user.name}の最大ダメージが上昇しました！(#{user.name}の最大ダメージ＝#{user.battle_param.max_damage})" \
            )
          end
        end,
        conditions: [CONDITIONS[:attack]]
      }
    ]
    AFTER_BATTLE_EFFECTS = [
      {
        level: 1,
        effect: Proc.new do |user, opponent_user|
          if user.is_win?
            product = rand(2..5)
            price = user.intelligence * product
            opponent_user.gold -= price
            opponent_user.gold -= price
            Message::MessageWriter.message(
              "【追い剥ぎ】#{price}Ｇと#{price}米を#{user.name}から奪われました！" \
            )
          end
        end,
        conditions: [CONDITIONS[:attack]]
      }
    ]
  end
end
