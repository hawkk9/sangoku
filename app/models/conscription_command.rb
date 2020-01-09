class ConscriptionCommand < ApplicationRecord
  NO_RANK = 0
  NO_S_RANK = 1

  SIEGE = 2
  MIRROR = 3

  MONTE_CARLO = 4
  MACAO = 5
  LAS_VEGAS = 6

  C_INFANTRY = 7
  C_CAVALRY = 8
  C_ARCHER = 9
  C_S_INFANTRY = 10
  C_S_CAVALRY = 11
  C_S_ARCHER = 12
  B_INFANTRY = 13
  B_CAVALRY = 14
  B_ARCHER = 15
  B_S_INFANTRY = 16
  B_S_CAVALRY = 17
  B_S_ARCHER = 18
  A_INFANTRY = 19
  A_CAVALRY = 20
  A_ARCHER = 21
  A_S_INFANTRY = 22
  A_S_CAVALRY = 23
  A_S_ARCHER = 24
  S_RANK = 25

  def execute(user)
    user.soldier_num += self.soldier_num
    user.save
  end
end
