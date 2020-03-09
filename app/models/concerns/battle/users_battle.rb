module Battle
  class UsersBattle
    def initialize(attack_user, defence_user, war_command)
      @attack_user = attack_user
      @defence_user = defence_user
      @attack_user.battle_param = Battle::BattleParam.new(@attack_user)
      @defence_user.battle_param = Battle::BattleParam.new(@defence_user)
      @battle_context = Battle::BattleContext.new(war_command.mode, war_command.town)
      @turn = 0
      @messages = []
    end

    def handle
      @messages << Message::MessageWriter.message(
        "【デバッグ用】【#{@attack_user.name}#{@attack_user.attack_and_defence_label(true)}】" \
        "【#{@defence_user.name}#{@defence_user.attack_and_defence_label(true)}】"
      )

      self.invoke_before_battle_skills

      @messages << Message::MessageWriter.message(
        "【#{@attack_user.name}#{@attack_user.attack_and_defence_label(true)}】" \
        "【#{@defence_user.name}#{@defence_user.attack_and_defence_label(true)}】"
      )

      @attack_user.calc_max_damage(@defence_user.defence(true))
      @defence_user.calc_max_damage(@attack_user.defence(true))
      @messages << Message::MessageWriter.message(
        "【#{@attack_user.name}の最大ダメージ：#{@attack_user.battle_param.max_damage}】" \
      "【#{@defence_user.name}の最大ダメージ：#{@defence_user.battle_param.max_damage}】"
      )

      @messages << Message::MessageWriter.message(
        "【最大戦闘ターン数】＝#{@battle_context.turn_limit}"
      )

      self.battle_loop

      self.invoke_after_battle_skills

      @messages.flatten!
      
      self.write_user_messages
    end
    
    protected

    def battle_loop
      while @attack_user.soldier_num > 0 && @defence_user.soldier_num > 0 && @turn < @battle_context.turn_limit
        @attack_user.calc_damage
        @defence_user.calc_damage

        self.invoke_battling_skills
        self.handle_normal_attack

        @turn += 1
      end
    end

    def handle_normal_attack
      @defence_user.soldier_num -= @attack_user.battle_param.damage
      if @defence_user.soldier_num <= 0
        @defence_user.battle_param.damage = 0
      end
      @attack_user.soldier_num -= @defence_user.battle_param.damage

      @messages << Message::MessageWriter.message(
        "ターン#{@turn}:#{@attack_user.name} #{@attack_user.soldier.name_with_rank}(#{@attack_user.soldier.attribute_label})" \
      " #{@attack_user.corrected_soldier_num}人↓(-#{@defence_user.battle_param.damage}) |" \
      "#{@defence_user.name} #{@defence_user.soldier.name_with_rank}(#{@defence_user.soldier.attribute_label})" \
      " #{@defence_user.corrected_soldier_num}人 ↓(-#{@attack_user.battle_param.damage})"
      )
    end

    def invoke_before_battle_skills
      self.invoke_skills(Skills::BaseSkill::TIMINGS[:before_battle])
    end
    
    def invoke_battling_skills
      self.invoke_skills(Skills::BaseSkill::TIMINGS[:battling])
    end

    def invoke_after_battle_skills
      self.invoke_skills(Skills::BaseSkill::TIMINGS[:after_battle])
    end

    def invoke_skills(timing)
      @attack_user.available_effects(timing, [Skills::BaseSkill::CONDITIONS[:attack]]).each do |effect|
        message = effect.call(@attack_user, @defence_user, @battle_context, true)
        @messages += message
      end
      @defence_user.available_effects(timing,[Skills::BaseSkill::CONDITIONS[:defence]]).each do |effect|
        message = effect.call(@defence_user, @attack_user, @battle_context, false)
        @messages += message
      end
    end

    def write_user_messages
      attack_user_messages = @messages.clone
      attack_user_messages << self.battle_result_message(@attack_user, @defence_user)
      Message::MessageWriter.write_user_log_file(@attack_user, attack_user_messages.reverse)

      defence_user_messages = @messages.clone
      defence_user_messages << self.battle_result_message(@defence_user, @attack_user)
      Message::MessageWriter.write_user_log_file(@defence_user, defence_user_messages.reverse)
    end

    def battle_result_message(user, opponent_user)
      messages = []
      user.is_win? ? messages << Message::MessageWriter.message("#{user.name}は#{opponent_user.name}を倒した！8の貢献を得ました。") :
        messages << Message::MessageWriter.message("#{user.name}は#{opponent_user.name}に敗北した。。8の貢献を得ました。")
      messages
    end
  end
end