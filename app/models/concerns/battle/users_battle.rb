module Battle
  class UsersBattle
    def initialize(attack_user, defence_user)
      @attack_user = attack_user
      @defence_user = defence_user
      @battle_context = Battle::BattleContext.new
      @turn = 0
      @messages = []
    end

    def start
      @messages << Message::MessageWriter.message(
        "【デバッグ用】【#{@attack_user.name}#{@attack_user.attack_and_defence_label}】" \
        "【#{@defence_user.name}#{@defence_user.attack_and_defence_label}】"
      )

      self.invoke_before_battle_skills
      self.handle_formation_correction

      @attack_user.define_max_damage(@defence_user.defence)
      @defence_user.define_max_damage(@attack_user.defence)

      self.write_before_battle_messages

      self.battle_loop

      self.invoke_after_battle_skills

      @messages.flatten!
      
      self.write_user_messages
      self.write_map_messages
    end
    
    protected

    def battle_loop
      while @attack_user.soldier.num > 0 && @defence_user.soldier.num > 0 && @turn < @battle_context.turn_limit
        @attack_user.define_damage
        @defence_user.define_damage

        self.invoke_battling_skills
        self.handle_normal_attack

        @turn += 1
      end
    end

    def handle_normal_attack
      @defence_user.soldier.num -= @attack_user.damage
      if @defence_user.soldier.num <= 0
        @defence_user.damage = 0
      end
      @attack_user.soldier.num -= @defence_user.damage

      @messages << Message::MessageWriter.message(
        "ターン#{@turn}:#{@attack_user.name} #{@attack_user.soldier.name_with_rank}(#{@attack_user.soldier.soldier_type_label})" \
      " #{@attack_user.corrected_soldier_num}人↓(-#{@defence_user.damage}) |" \
      "#{@defence_user.name} #{@defence_user.soldier.name_with_rank}(#{@defence_user.soldier.soldier_type_label})" \
      " #{@defence_user.corrected_soldier_num}人 ↓(-#{@attack_user.damage})"
      )
    end

    def handle_formation_correction
      # 攻守補正
      correction = @attack_user.formation_correction
      correction.call(@attack_user, @defence_user, @battle_context) unless correction.nil?
      correction = @defence_user.formation_correction
      correction.call(@defence_user, @attack_user, @battle_context) unless correction.nil?

      # 相性
      @messages << @attack_user.calc_advantageous(@defence_user)
      @messages << @defence_user.calc_advantageous(@attack_user)
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
      @attack_user.available_skill_effects(timing, [Skills::BaseSkill::CONDITIONS[:attack]]).each do |effect|
        message = effect.call(@attack_user, @defence_user, @battle_context)
        @messages += message
      end
      @defence_user.available_skill_effects(timing,[Skills::BaseSkill::CONDITIONS[:defence]]).each do |effect|
        message = effect.call(@defence_user, @attack_user, @battle_context)
        @messages += message
      end
    end

    def write_before_battle_messages
      @messages << Message::MessageWriter.message(
        "#{@attack_user.country.name}の#{@attack_user.name}（#{@attack_user.formation_name}）は#{@defence_user.name}（#{@defence_user.formation_name}）と戦闘しました！"
      )

      @messages << Message::MessageWriter.message(
        "【#{@attack_user.name}（攻：守＝#{@attack_user.attack_percent}%：#{@attack_user.defence_percent}%）】" \
        "【#{@defence_user.name}（攻：守＝#{@defence_user.attack_percent}%：#{@defence_user.defence_percent}%）】"
      )

      @messages << Message::MessageWriter.message(
        "【#{@attack_user.name}#{@attack_user.attack_and_defence_label}】" \
        "【#{@defence_user.name}#{@defence_user.attack_and_defence_label}】"
      )

      @messages << Message::MessageWriter.message(
        "【#{@attack_user.name}の最大ダメージ：#{@attack_user.max_damage}】" \
      "【#{@defence_user.name}の最大ダメージ：#{@defence_user.max_damage}】"
      )

      @messages << Message::MessageWriter.message(
        "【最大戦闘ターン数】＝#{@battle_context.turn_limit}"
      )
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


    def write_map_messages
      map_messages = []
      if @attack_user.is_win?
        map_messages << Message::MessageWriter.message(
          "<font color='blue'>【勝利】</font>#{@attack_user.name}は#{@defence_user.name}を倒しました！"
        )
        map_messages << Message::MessageWriter.message(
          "#{@defence_user.name}『負け！』 #{@attack_user.name}『勝ち！』"
        )
      else
        map_messages << Message::MessageWriter.message(
          "<font color='red'>【敗北】</font>#{@attack_user.name}は#{@defence_user.name}に敗北した。。"
        )
        map_messages << Message::MessageWriter.message(
          "#{@defence_user.name}『勝ち！』 #{@attack_user.name}『負け！』"
        )
      end
      Message::MessageWriter.write_map_log_file(map_messages.reverse)
    end
  end
end