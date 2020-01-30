module Skills
  class NinjaSkill < Skills::BaseSkill
    EFFECTS = [{
      level: 1,
      effect: Proc.new do |user, opponent_user|
        odds = user.leadership / 11
        if rand(1..100) <= odds
          opponent_user.damage = 0
          Message::MessageWriter.message(
            "【幻影】#{user.name}が幻影を発動しました。#{user.name}は攻撃を受けません。"
          )
        end
      end,
      timings: [BATTLING]
    },
    {
      level: 3,
      effect: Proc.new do |user, opponent_user|
        odds = user.leadership / 13
        if rand(1..100) <= odds
          user.damage += opponent_user.damage
          Message::MessageWriter.message(
            "【受け流し】#{user.name}が受け流しを発動しました。#{opponent_user.name}が与えるダメージが#{user.name}の攻撃力に加わります"
          )
        end
      end,
      timings: [BATTLING]
    }]
  end
end
