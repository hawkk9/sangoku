module Battle
  class BattleUser
    delegate :name, :strength,:intelligence, :leadership, :charm, :soldier, :formation, :formation_name, :country,
             :main_status, :corrected_soldier_num, :character_id, to: :@user

    attr_accessor :before_soldier_num
    attr_accessor :damage
    attr_reader :max_damage
    attr_accessor :attack_percent
    attr_accessor :defence_percent
    attr_accessor :attack_correction
    attr_accessor :defence_correction
    attr_accessor :down_correction
    attr_accessor :disable_advantageous
    attr_accessor :disable_formation

    def initialize(user)
      @user = user
      @max_damage = 1
      self.before_soldier_num = user.soldier.num
      self.attack_percent = 100
      self.defence_percent = 100
      self.attack_correction = 0
      self.defence_correction = 0
      self.down_correction = 0
      self.disable_advantageous = false
      self.disable_formation = false
    end
    
    def attack
      attack = @user.attack * self.attack_percent / 100
      attack += self.attack_correction
      attack.to_i 
    end

    def defence
      defence = @user.defence * self.defence_percent / 100
      defence += self.defence_correction
      defence.to_i
    end

    def attack_and_defence_label
      "（攻：守＝#{self.attack}：#{self.defence}）"
    end

    def available_effects(timing)
      self.soldier.available_effects(timing) + self.available_skill_effects(timing)
    end

    def available_skill_effects(timing)
      typed_skills = @user.skills.map(&:typed_skill)
      typed_skills.map { |typed_skill| typed_skill.available_effects(timing) }.flatten
    end

    def formation_correction
      return nil if self.disable_formation
      Formations::Formation.formation_correction_hash[@user.formation.to_sym]
    end

    def calc_advantageous(opponent_user)
      messages = []
      return messages if self.disable_advantageous
      return messages if self.disable_formation || opponent_user.disable_formation
      if self.soldier.is_advantageous(opponent_user.soldier.soldier_type)
        self.add_max_damage(2)
        messages << "【兵種相性】#{self.name}の最大ダメージが2増加しました。"
      end
      messages
    end

    def define_max_damage(defence)
      diff = self.attack - defence
      self.add_max_damage(diff / 20) if diff > 0
    end

    def define_damage
      self.damage = rand(1..self.max_damage)
    end

    def is_win?
      @user.soldier.num > 0
    end

    def add_status_percents(percent)
      self.attack_percent += percent
      self.defence_percent += percent
    end

    def add_max_damage(value)
      @max_damage += value
      @max_damage = 1 if @max_damage < 1
    end
  end
end
