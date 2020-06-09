require 'rails_helper'

RSpec.describe Skills::SenjutuSkill, type: :model do
  describe '不意打ち' do
    let(:user) { Battle::BattleUser.new(create(:user)) }
    let(:opponent_user) { Battle::BattleUser.new(create(:opponent_user)) }
    let(:battle_context) { Battle::BattleContext.new }
    it '' do
      Skills::SenjutuSkill.fuiuti_before_battle_effect(user, opponent_user, battle_context)
      expect(opponent_user.attack_percent).to equal(-5)
    end
  end
end
