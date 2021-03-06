module Skills
  class NinjutuSkill < Skills::BaseSkill
    class << self
      def all_effects
        [
          {
            level: 1,
            effect: Battle::Effect.new(method(:genei_battling_effect), :battling)
          },
          {
            level: 2,
            effect: Battle::Effect.new(method(:oukyu_after_battle_effect), :after)
          },
          {
            level: 3,
            effect: Battle::Effect.new(method(:ukenagasi_battling_effect), :battling)
          }
        ]
      end

      def genei_battling_effect(user, opponent_user, battle_context)
        messages = []
        odds = user.leadership / 11
        if Util::Calculator::draw_lots(odds)
          opponent_user.damage = 0
          messages << Message::MessageWriter.message(
            "【幻影】#{user.name}が幻影を発動しました。#{user.name}は攻撃を受けません。"
          )
        end
        messages
      end

      def oukyu_after_battle_effect(user, opponent_user, battle_context)
        messages = []
        odds = user.leadership / 3
        if Util::Calculator::draw_lots(odds)
          downed_num = user.before_soldier_num - user.soldier.num
          return messages if downed_num <= 0
          recovery_num = (downed_num * (rand(1..5) / 10.0)).to_i
          user.soldier.num += recovery_num
          messages << Message::MessageWriter.message(
            "【応急処置】#{user.name}の兵が#{recovery_num}人、復帰しました"
          )
        end
        messages
      end

      def ukenagasi_battling_effect(user, opponent_user, battle_context)
        messages = []
        odds = user.leadership / 13
        if Util::Calculator::draw_lots(odds)
          user.damage += opponent_user.damage
          messages << Message::MessageWriter.message(
            "【受け流し】#{user.name}が受け流しを発動しました。#{opponent_user.name}が与えるダメージが#{user.name}の攻撃力に加わります"
          )
        end
        messages
      end
    end
  end
end
