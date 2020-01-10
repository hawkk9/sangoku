class ConscriptionCommand < ApplicationRecord
  # 必要階級
  C_NEED_RANK = 5001
  C_S_NEED_RANK = 8000
  B_NEED_RANK = 11001
  B_S_NEED_RANK = 14500
  A_NEED_RANK = 18000
  A_S_NEED_RANK = 22000
  S_NEED_RANK = 26000

  # 必要技術
  C_NEED_TECHNOLOGY = 200
  B_NEED_TECHNOLOGY = 500
  A_NEED_TECHNOLOGY = 800
  S_NEED_TECHNOLOGY = 950
  S_NEED_TECHNOLOGY = 990

  def execute(user)
    user.soldier_num += self.soldier_num
    user.save
  end
end
