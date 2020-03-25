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
  has_one :soldier

  attr_accessor :battle_param

  def formation_name
    Formations::Formation::LABEL_HASH[self.formation.to_sym][:name]
  end

  def corrected_soldier_num
    self.soldier.num > 0 ? self.soldier.num : 0
  end

  def officer_type_main_status_hash
    {
      STRENGTH => self.strength, INTELLIGENCE => self.intelligence,
      LEADERSHIP => self.leadership, CHARM => self.charm
    }
  end

  def officer_type
    self.officer_type_main_status_hash
      .max_by{ |type, value| value }
      .first
  end

  def officer_type_label
    OFFICER_TYPE_LABEL_HASH[self.officer_type]
  end

  def officer_type_equip_label
    OFFICER_TYPE_EQUIP_LABEL_HASH[self.officer_type]
  end

  def attack
    attack = (self.officer_type_main_status_hash[self.officer_type] + self.equipment_param) * self.soldier.attack + self.arm
    attack.to_i
  end

  def defence
    defence = (self.officer_type_main_status_hash[self.officer_type] + self.equipment_param) * self.soldier.defence + (self.training / 2) + self.guard
    defence.to_i
  end

  def equipment_param
    return 0 unless self.soldier.enable_equip
    {
      STRENGTH => 0, INTELLIGENCE => self.book,
      LEADERSHIP => 0, CHARM => self.flag
    }[self.officer_type]
  end

  def attack_and_defence_label
    "（攻：守＝#{self.attack}：#{self.defence}）"
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
