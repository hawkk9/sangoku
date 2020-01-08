class ConscriptionCommand < ApplicationRecord
  def execute(user)
    user.soldier_num += self.soldier_num
    user.save
  end
end
