module Battles
  class UsersBattle
    def initialize(attack_user, defence_user, war_command)
      @attack_user = attack_user
      @defence_user = defence_user
      @war_command = war_command
      @turn = 0
      @messages = []
    end

    def handle
      @attack_user.mode = @war_command.mode
      @attack_user.opponent_user = @defence_user
      @defence_user.opponent_user = @attack_user

      self.invoke_before_battle_skills

      @attack_user.calc_max_damage
      @defence_user.calc_max_damage
      @messages << Message::MessageWriter.message(
        "【#{@attack_user.name}の最大ダメージ：#{@attack_user.max_damage}】" \
      "【#{@defence_user.name}の最大ダメージ：#{@attack_user.max_damage}】"
      )

      while @attack_user.soldier_num > 0 && @defence_user.soldier_num > 0
        @attack_user.calc_damage
        @defence_user.calc_damage

        self.invoke_battling_skills
        self.handle_normal_attack

        @turn += 1
      end
      @messages.flatten!
      
      self.write_user_messages
      self.write_map_messages
    end
    
    protected

    def handle_normal_attack
      @defence_user.soldier_num -= @attack_user.damage
      if @defence_user.soldier_num <= 0
        @defence_user.damage = 0
      end
      @attack_user.soldier_num -= @defence_user.damage

      @messages << Message::MessageWriter.message(
        "ターン#{@turn}:#{@attack_user.name} #{@attack_user.soldier.name_with_rank}(#{@attack_user.soldier.attribute_label})" \
      " #{@attack_user.corrected_soldier_num}人↓(-#{@defence_user.damage}) |" \
      "#{@defence_user.name} #{@defence_user.soldier.name_with_rank}(#{@defence_user.soldier.attribute_label})" \
      " #{@defence_user.corrected_soldier_num}人 ↓(-#{@attack_user.damage})"
      )
    end

    def invoke_before_battle_skills
      self.invoke_skills([Skills::BaseSkill::BEFORE_BATTLE])
    end
    
    def invoke_battling_skills
      self.invoke_skills([Skills::BaseSkill::BATTLING])
    end

    def invoke_skills(timings)
      @attack_user.available_effects([Skills::BaseSkill::ATTACK] + timings).each do |effect|
        message = effect.call(@attack_user, @defence_user)
        @messages << message if message.present?
      end
      @defence_user.available_effects([Skills::BaseSkill::DEFENCE] + timings).each do |effect|
        message = effect.call(@defence_user, @attack_user)
        @messages << message if message.present?
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

    def write_map_messages
      map_messages = []
      map_messages << Message::MessageWriter.message("#{@attack_user.country.name}の#{@attack_user.name}は#{@war_command.town.name}（#{@war_command.town.country.name}）へ攻め込みました！")
      if @attack_user.is_win?
        map_messages << Message::MessageWriter.message("<font color='blue'>【勝利】</font>#{@attack_user.name}は#{@defence_user.name}を倒しました！")
        map_messages << Message::MessageWriter.message("#{@defence_user.name}『負け！』 #{@attack_user.name}『勝ち！』")
      else
        map_messages << Message::MessageWriter.message("<font color='red'>【敗北】</font>#{@attack_user.name}は#{@defence_user.name}に敗北した。。")
        map_messages << Message::MessageWriter.message("#{@defence_user.name}『勝ち！』 #{@attack_user.name}『負け！』")
      end
      Message::MessageWriter.write_map_log_file(map_messages.reverse)
    end

    def battle_result_message(user, opponent_user)
      messages = []
      user.is_win? ? messages << Message::MessageWriter.message("#{user.name}は#{opponent_user.name}を倒した！8の貢献を得ました。") :
        messages << Message::MessageWriter.message("#{user.name}は#{opponent_user.name}に敗北した。。8の貢献を得ました。")
      messages
    end
  end
end