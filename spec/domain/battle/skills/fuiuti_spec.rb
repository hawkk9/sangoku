require 'rails_helper'

RSpec.describe Battle::Skills::Fuiuti, type: :model do
  describe '不意打ち' do
    it '守備側の攻守が-5%されること' do
      user = build_stubbed(:user)
      opponent_user = build_stubbed(:user)
      before_battle_user = Battle::BeforeBattleUser.new(user)
      before_battle_opponent_user = Battle::BeforeBattleUser.new(opponent_user)
      fuiuti = Battle::Skills::Fuiuti.new(before_battle_user, before_battle_opponent_user)
      fuiuti.handle
      expect(before_battle_opponent_user.attack_percent).to equal(95)
    end
  end
end
