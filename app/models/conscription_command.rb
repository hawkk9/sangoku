class ConscriptionCommand < ApplicationRecord
  include UserMessage

  has_one :command

  def execute
    messages = []
    messages << validate_can_employ
    if messages.length == 0
      self.user.gold -= self.price
      self.user.soldier_type = self.soldier_type
      self.user.soldier_num += self.soldier_num
      self.user.save
      messages << message("#{Game.first.month}月:#{user.soldier.name_with_rank}を<font color='red'>+#{self.soldier_num}</font>徴兵しました。金：-<font color='#0000ff'>#{self.price}</font>")
    end
    messages
  end

  def validate_can_employ
    return message('【徴兵失敗】：お金が足りないので徴兵できませんでした。') if self.price > self.user.gold
  end

  def inputed_label
    "#{user.soldier.name_with_rank}#{Command::COMMAND_LABEL_HASH[self.command.command_type]}（#{self.soldier_num}人:#{self.price}Ｇ）"
  end

  protected

  def price
    self.user.soldier.gold * self.soldier_num
  end

  def user
    self.command.user
  end
end
