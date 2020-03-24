module Skills
  class SenjutuSkill < Skills::BaseSkill
    class << self
      def before_battle_effects
        [
          {
            level: 1,
            effect: method(:fuiuti_before_battle_effect),
            conditions: [Skills::BaseSkill::CONDITIONS[:attack]]
          },
          {
            level: 2,
            effect: method(:yasyu_before_battle_effect),
            conditions: [Skills::BaseSkill::CONDITIONS[:attack]]
          },
          {
            level: 3,
            effect: method(:kyousyu_before_battle_effect),
            conditions: [Skills::BaseSkill::CONDITIONS[:attack]]
          },
        ]
      end

      def battling_effects
        [
          {
            level: 2,
            effect: method(:yasyu_battling_effect),
            conditions: [Skills::BaseSkill::CONDITIONS[:attack]]
          },
          {
            level: 3,
            effect: method(:kyousyu_battling_effect),
            conditions: [Skills::BaseSkill::CONDITIONS[:attack]]
          },
        ]
      end

      def fuiuti_before_battle_effect(user, opponent_user, battle_context, is_attack)
        messages = []
        enable = if user.strength >= user.intelligence
                   user.strength > opponent_user.strength
                 else
                   user.intelligence > opponent_user.intelligence
                 end
        if enable
          opponent_user.battle_param.add_status_percents(-5)
          messages << Message::MessageWriter.message(
            "【不意打ち】不意打ちにより攻守が－５%になりました"
          )
        end
        messages
      end

      def yasyu_before_battle_effect(user, opponent_user, battle_context, is_attack)
        messages = []
        if battle_context.mode == :yasyu.to_s
          enable = [user.strength, user.intelligence].max >= 130
          if enable
            opponent_user.battle_param.add_status_percents(-5)
            messages << Message::MessageWriter.message(
              "【夜襲】夜襲により攻守が-5%になりました"
            )
          end
        end
        messages
      end

      def kyousyu_before_battle_effect(user, opponent_user, battle_context, is_attack)
        messages = []
        if battle_context.mode == :kyousyu.to_s
          enable = [user.strength, user.intelligence].max >= 160
          if enable
            opponent_user.battle_param.add_status_percents(-10)
            messages << Message::MessageWriter.message(
              "【強襲】強襲により攻守が-10%になりました"
            )
          end
        end
        messages
      end

      def yasyu_battling_effect(user, opponent_user, battle_context, is_attack)
        messages = []
        if battle_context.mode == :yasyu.to_s
          odds = (user.strength + user.intelligence) / 10
          if Util::Calculator::draw_lots(odds)
            damage = rand(1..5)
            opponent_user.soldier.num -= damage
            messages << Message::MessageWriter.message(
              "【夜襲】#{user.name}が夜襲を仕掛けました。兵が数人倒されました。" \
              "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier.num}人 ↓(-#{damage})"
            )
          end
        end
        messages
      end

      def kyousyu_battling_effect(user, opponent_user, battle_context, is_attack)
        messages = []
        if battle_context.mode == :kyousyu.to_s
          odds = (user.intelligence + user.charm) / 7
          if Util::Calculator::draw_lots(odds)
            damage = rand(1..7)
            opponent_user.soldier.num -= damage
            messages << Message::MessageWriter.message(
              "【強襲】#{user.name}が強襲を仕掛けました。兵が数人倒されました。" \
              "#{opponent_user.name} #{opponent_user.soldier.name_with_rank} #{opponent_user.soldier.num}人 ↓(-#{damage})"
            )
          end
        end
        messages
      end
    end
  end
end
