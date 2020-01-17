class WarCommand < ApplicationRecord
  has_one :command
  belongs_to :town

  def inputed_label
    "#{self.town.name}へ出兵"
  end
end
