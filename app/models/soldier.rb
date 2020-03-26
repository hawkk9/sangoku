class Soldier < ApplicationRecord
  include Soldiers::SoldierConstant

  enum rank: SOLDIER_RANK, _prefix: true
  enum soldier_type: SOLDIER_TYPE, _prefix: true

  belongs_to :user

  ADVANTAGEOUS_HASH = {
    :infantry => :archer,
    :cavalry => :infantry,
    :archer => :cavalry
  }

  delegate :name, :attack, :defence, :name_with_rank, :soldier_type_label, :enable_equip, :available_effects, to: :@concrete_soldier

  after_initialize do |soldier|
    @concrete_soldier = Soldiers::ConcreteSoldier.to_concrete_soldier(
      soldier.user.officer_type,
      soldier.soldier_type,
      soldier.rank
    )
  end

  def is_advantageous(opponent_soldier_type)
    opponent_soldier_type == ADVANTAGEOUS_HASH[self.soldier_type]
  end
end