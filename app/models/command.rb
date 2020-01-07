class Command < ApplicationRecord
  NONE = 0
  WAIT = 1

  # 内政
  AGRICULTURE = 2
  AGRICULTURE_EXPANSION = 3
  COMMERCE = 4
  COMMERCE_EXPANSION = 5
  TECHNOLOGY = 6
  WALL = 7
  WALL_EXPANSION = 8
  WALL_DURABILITY = 9
  RICE_ALMS = 10
  MANY_RICE_ALMS = 11

  # 軍事
  CONSCRIPTION = 12
  TRAINING = 13
  MANY_TRAINING = 14

  COMMAND_SHORT_LABEL_HASH = {
    nil => '-',
    NONE => '何もしない',
    WAIT => '待機',
    CONSCRIPTION => '徴兵'
  }.freeze

  COMMAND_LABEL_HASH = {

  }

  has_one :conscription_command
end
