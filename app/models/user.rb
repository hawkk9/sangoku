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
    (self.charm + self.flag) * self.soldier.attack + self.strength + self.arm
  end

  def defence
    (self.charm + self.flag) * self.soldier.defense + (self.training / 2) + self.guard
  end

  def soldier
    Soldiers::Soldier.find_by_officer_and_type(self.officer_type, self.soldier_type)
  end
end
