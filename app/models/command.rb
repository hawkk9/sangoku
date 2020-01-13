class Command < ApplicationRecord
  ALL = 'all'

  MAX_NUM = 96

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

  COMMAND_LABEL_HASH = {
    nil => '-',
    NONE => '何もしない',
    WAIT => '待機',
    AGRICULTURE => '農業開発',
    AGRICULTURE_EXPANSION => '農業用地拡大',
    COMMERCE => '商業発展',
    COMMERCE_EXPANSION => '商業用地拡大',
    TECHNOLOGY => '技術開発',
    WALL => '城壁強化',
    WALL_EXPANSION => '城壁拡張',
    WALL_DURABILITY => '城壁耐久力強化',
    RICE_ALMS => '米施し',
    MANY_RICE_ALMS => '大量米施し',

    CONSCRIPTION => '徴兵'
  }.freeze

  has_one :conscription_command
  belongs_to :user

  def execute
    self.typed_command.execute(self.user)
    self.destroy
    self.decrement_user_command_no
  end

  def decrement_user_command_no
    self.user.commands.each do |command|
      command.command_no -= 1
      command.save
    end
  end

  def inputed_label
    typed = self.typed_command
    typed.class == Command ? COMMAND_LABEL_HASH[self.command_type] : typed.inputed_label(self.user)
  end

  protected

  def typed_command
    case self.command_type
    when CONSCRIPTION
      self.conscription_command
    else
      self
    end
  end
end
