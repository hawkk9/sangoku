class ConscriptionCommand < ApplicationRecord
  include Soldiers::SoldierConstant

  enum soldier_rank: SOLDIER_RANK, _prefix: true
  enum soldier_type: SOLDIER_TYPE, _prefix: true

  belongs_to :command

  def execute
    messages = []
    result = self.validate_can_employ
    unless result.nil?
      messages << result
    end
    if messages.length == 0
      messages << Message::MessageWriter.message("#{Game.first.month}月:#{self.soldier.name_with_rank}を<font color='red'>+#{self.increase_soldier_num}</font>徴兵しました。金：-<font color='#0000ff'>#{self.price}</font>")
      self.town.farmer -= self.need_farmer
      self.town.allegiance -= self.need_allegiance
      self.town.save
      self.user.gold -= self.price
      self.user.training -= self.decrease_training
      self.user.soldier.num += self.increase_soldier_num
      self.user.soldier.soldier_type = self.soldier_type
      self.user.soldier.save
      self.user.save
    end
    Message::MessageWriter.write_user_log_file(self.user, messages)
  end

  def validate_can_employ
    return Message::MessageWriter.message('【徴兵失敗】：金が足りませんです。') if self.price > self.user.gold
    return Message::MessageWriter.message('【徴兵失敗】：農民が居ないので徴兵できませんでした。') if self.town.farmer < self.need_farmer
    return Message::MessageWriter.message('【徴兵失敗】：民忠が低いです。') if self.town.allegiance < self.need_allegiance
    return Message::MessageWriter.message('【徴兵失敗】：この都市にはその兵種を雇う技術が無いようです。') if self.town.technology < self.soldier.technology
  end

  def inputed_label
    "#{self.soldier.name_with_rank}#{Command::COMMAND_LABEL_HASH[self.command.command_type]}（#{self.soldier_num}人:#{self.price}Ｇ）"
  end

  protected

  def price
    self.soldier.gold * self.increase_soldier_num
  end

  def need_farmer
    self.increase_soldier_num * 4
  end

  def need_allegiance
    self.increase_soldier_num / 10
  end

  # HACK: soldier_typeやsoldier_numを変更した後に参照すると意図しない値になる
  def increase_soldier_num
    soldier_num = self.soldier_type == self.user.soldier.soldier_type ?
                    self.user.soldier.num + self.soldier_num : self.soldier_num
    increased_soldier_num = [soldier_num, self.user.leadership].min
    [increased_soldier_num - self.user.soldier.num, 0].max
  end

  def decrease_training
    [self.increase_soldier_num, self.user.training].min
  end

  def user
    self.command.user
  end

  def town
    self.user.town
  end

  def soldier
    @soldier = Soldiers::ConcreteSoldier.to_concrete_soldier(
      self.user.officer_type,
      self.soldier_type,
    self.soldier_rank
    )
  end
end
