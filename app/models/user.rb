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

  has_many :commands
  has_many :achievements
  belongs_to :town
  belongs_to :country
  has_one :town_defence

  def officer_type
    CHARM
  end

  def officer_type_label
    OFFICER_TYPE_LABEL_HASH[self.officer_type]
  end

  def officer_type_equip_label
    OFFICER_TYPE_EQUIP_LABEL_HASH[self.officer_type]
  end

  def attack
    ((self.charm + self.flag) * self.soldier.attack + self.strength + self.arm).to_i
  end

  def defence
    ((self.charm + self.flag) * self.soldier.defense + (self.training / 2) + self.guard).to_i
  end

  def soldier
    Soldiers::Soldier.find_by_officer_and_type(self.officer_type, self.soldier_type)
  end

  def message_logs
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
