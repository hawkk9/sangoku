module Skills
  class NinjutuSkill < Skills::BaseSkill
    class << self
      def battling_effects
        [
          {
            level: 1,
            effect: method(:genei_battling_effect),
            conditions: []
          },
          {
            level: 3,
            effect: method(:ukenagasi_battling_effect),
            conditions: []
          }
        ]
      end

      def after_battle_effects
        [
          {
            level: 2,
            effect: method(:oukyu_after_battle_effect),
            conditions: []
          }
        ]
      end

      def genei_battling_effect(user, opponent_user, battle_context, is_attack)
        messages = []
        odds = user.leadership / 11
        if Util::Calculator::draw_lots(odds)
          opponent_user.battle_param.damage = 0
          messages << Message::MessageWriter.message(
            "【幻影】#{user.name}が幻影を発動しました。#{user.name}は攻撃を受けません。"
          )
        end
        messages
      end

      def oukyu_after_battle_effect(user, opponent_user, battle_context, is_attack)
        messages = []
        odds = user.leadership / 3
        if Util::Calculator::draw_lots(odds)
          downed_num = user.battle_param.before_soldier_num - user.soldier_num
          return messages if downed_num <= 0
          recovery_num = (downed_num * (rand(1..5) / 10.0)).to_i
          user.soldier_num += recovery_num
          messages << Message::MessageWriter.message(
            "【応急処置】#{user.name}の兵が#{recovery_num}人、復帰しました"
          )
        end
        messages
      end

      def ukenagasi_battling_effect(user, opponent_user, battle_context, is_attack)
        messages = []
        odds = user.leadership / 13
        if Util::Calculator::draw_lots(odds)
          user.battle_param.damage += opponent_user.battle_param.damage
          messages << Message::MessageWriter.message(
            "【受け流し】#{user.name}が受け流しを発動しました。#{opponent_user.name}が与えるダメージが#{user.name}の攻撃力に加わります"
          )
        end
        messages
      end
    end
  end
end
