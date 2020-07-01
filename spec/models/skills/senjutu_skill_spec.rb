require 'rails_helper'

RSpec.describe Skills::SenjutuSkill, type: :model do
  describe '不意打ち' do
    let(:status) { 100 }
    let(:user) { create(:user, strength: status) }
    let!(:soldier) { create(:soldier, user: user) }
    let(:battle_user) { Battle::AttackUser.new(user, nil) }
    let(:opponent_user) { create(:opponent_user) }
    let!(:opponent_soldier) { create(:soldier, user: opponent_user) }
    let(:opponent_battle_user) { Battle::BattleUser.new(opponent_user) }
    let(:battle_context) { Battle::BattleContext.new }
    context '攻撃側の武力が守備側の武力より高い場合' do
      let(:status) { 101 }
      it '守備側の攻守が-5%されること' do
        Skills::SenjutuSkill.fuiuti_before_battle_effect(battle_user, opponent_battle_user, battle_context)
        expect(opponent_battle_user.attack_percent).to equal(95)
        expect(opponent_battle_user.defence_percent).to equal(95)
      end
    end
  end
end
