class Soldier < ApplicationRecord
  enum rank: {
    none: 0, none_sp: 1, c: 2, c_sp: 3,
    b: 4, b_sp: 5, a: 6, a_sp: 7,
    s: 8, siege: 9, monte: 10, macao: 11,
    vegas: 12, mirror: 13
  }, _prefix: true

  enum soldier_type: {
    none: 0,
    infantry: 1,
    cavalry: 2,
    archer: 3
  }, _prefix: true

  belongs_to :user

  ADVANTAGEOUS_HASH = {
    :infantry => :archer,
    :cavalry => :infantry,
    :archer => :cavalry
  }

  delegate :name, :attack, :defence, :name_with_rank, :soldier_type_label, :enable_equip, to: :@concrete_soldier

  after_initialize do
    @concrete_soldier = Soldiers::ConcreteSoldier.to_concrete_soldier(self)
  end

  def is_advantageous(opponent_soldier_type)
    opponent_soldier_type == ADVANTAGEOUS_HASH[self.soldier_type]
  end
end