require 'rails_helper'

RSpec.describe Skills::SenjutuSkill, type: :model do
  describe '不意打ち' do
    let(:user) { create(:user) }
    let!(:soldier) { create(:soldier, user: user) }
    let(:battle_user) { Battle::BattleUser.new(user) }
    let(:opponent_user) { create(:opponent_user) }
    let!(:opponent_soldier) { create(:soldier, user: opponent_user) }
    let(:opponent_battle_user) { Battle::BattleUser.new(opponent_user) }
    let(:battle_context) { Battle::BattleContext.new }
    it '' do
      Skills::SenjutuSkill.fuiuti_before_battle_effect(opponent_user, opponent_battle_user, battle_context)
      expect(opponent_battle_user.attack_percent).to equal(-5)
    end
  end
end
