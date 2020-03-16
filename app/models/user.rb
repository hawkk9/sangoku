class User < ApplicationRecord
  # 官種
  STRENGTH = 0
  INTELLIGENCE = 1
  LEADERSHIP = 2
  CHARM = 3

  OFFICER_TYPE_STATUS_LABEL_HASH = {
    STRENGTH => '武力',
    INTELLIGENCE => '知力',
    LEADERSHIP => '統率力',
    CHARM => '人望'
  }

  OFFICER_TYPE_LABEL_HASH = {
    STRENGTH => '武官',
    INTELLIGENCE => '文官',
    LEADERSHIP => '統率官',
    CHARM => '人望官'
  }

  OFFICER_TYPE_EQUIP_LABEL_HASH = {
    INTELLIGENCE => '書物',
    CHARM => '旗'
  }

  enum formation: {
    gyorin: 0, gangetu: 1, gankou: 2,
    kakuyoku: 3, housi: 4, kouyaku: 5,
    tyouda: 6, houen: 7, kurumagakari: 8,
    tora: 9, moroha: 10, donjin: 11,
    densetu: 12
  }

  has_many :commands
  has_many :achievements
  has_many :skills
  belongs_to :town
  belongs_to :country
  has_one :town_defence

  attr_accessor :battle_param

  def calc_max_damage(defence)
    self.battle_param.max_damage += (self.attack(true) - defence) / 20 + 1
  end

  def calc_advantageous(opponent_user)
    messages = []
    if self.soldier.is_advantageous(opponent_user.soldier.attribute)
      self.battle_param.max_damage += 2
      messages << "【兵種相性】#{self.name}の最大ダメージが2増加しました。"
    end
    messages
  end

  def calc_damage
    self.battle_param.damage = rand(1..self.battle_param.max_damage)
  end

  def available_skill_effects(timing, conditions)
    typed_skills = self.skills.map(&:typed_skill)
    typed_skills.map { |typed_skill| typed_skill.available_effects(timing, conditions) }.flatten
  end

  def formation_correction
    Formations::Formation.formation_correction_hash[self.formation.to_sym]
  end

  def formation_name
    Formations::Formation::LABEL_HASH[self.formation.to_sym][:name]
  end

  def corrected_soldier_num
    self.soldier_num > 0 ? self.soldier_num : 0
  end

  def officer_type
    CHARM
  end

  def officer_type_label
    OFFICER_TYPE_LABEL_HASH[self.officer_type]
  end

  def officer_type_equip_label
    OFFICER_TYPE_EQUIP_LABEL_HASH[self.officer_type]
  end

  def attack(in_battle = false)
    attack = (self.charm + self.flag) * self.soldier.attack + self.strength + self.arm
    if in_battle
      attack = attack * self.battle_param.attack_percent / 100
      attack += self.battle_param.attack_correction
    end
    attack.to_i
  end

  def defence(in_battle = false)
    defence = ((self.charm + self.flag) * self.soldier.defense + (self.training / 2) + self.guard).to_i
    if in_battle
      defence = defence * self.battle_param.defence_percent / 100
      defence += self.battle_param.defence_correction
    end
    defence.to_i
  end

  def attack_and_defence_label(in_battle = false)
    "（攻：守＝#{self.attack(in_battle)}：#{self.defence(in_battle)}）"
  end

  def soldier
    Soldiers::Soldier.find_by_officer_and_type(self.officer_type, self.soldier_type)
  end

  def is_win?
    self.soldier_num > 0
  end

  def messages
    path = File.join(Rails.root, 'tmp/user', self.character_id)
    lines = []
    if File.exist?(path)
      File.foreach(path) do |line|
        lines << line.chomp
      end
    end
    lines
  end

  def update_time_min_and_sec
    (self.update_time / 60).minutes + (self.update_time % 60).seconds
  end

  def next_update_time
    now = Time.new
    now_min_and_sec = now.min.minutes + now.sec.seconds
    now = now.change(hour: now.hour + 1) if now_min_and_sec > update_time_min_and_sec
    now.change(min: update_time_min_and_sec / 1.minutes, sec: update_time_min_and_sec % 60.seconds)
  end

  def left_seconds_to_update_time
    (next_update_time - Time.new).to_i
  end
end
