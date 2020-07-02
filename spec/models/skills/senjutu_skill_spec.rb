require 'rails_helper'

RSpec.describe Skills::SenjutuSkill, type: :model do
  let(:status) { 100 }
  let(:mode) { nil }
  let(:user) { create(:user, strength: status) }
  let!(:soldier) { create(:soldier, user: user) }
  let(:battle_user) { Battle::AttackUser.new(user, mode) }
  let(:opponent_user) { create(:opponent_user) }
  let!(:opponent_soldier) { create(:soldier, user: opponent_user) }
  let(:opponent_battle_user) { Battle::BattleUser.new(opponent_user) }
  let(:battle_context) { Battle::BattleContext.new }
  describe '不意打ち' do
    context '攻撃側の武力が守備側の武力より高い場合' do
      let(:status) { 101 }
      it '守備側の攻守が-5%されること' do
        Skills::SenjutuSkill.fuiuti_before_battle_effect(battle_user, opponent_battle_user, battle_context)
        expect(opponent_battle_user.attack_percent).to equal(95)
        expect(opponent_battle_user.defence_percent).to equal(95)
      end
    end

    context '攻撃側の武力が守備側の武力より低い場合' do
      let(:status) { 99 }
      it '守備側の攻守が-5%されないこと' do
        Skills::SenjutuSkill.fuiuti_before_battle_effect(battle_user, opponent_battle_user, battle_context)
        expect(opponent_battle_user.attack_percent).to equal(100)
        expect(opponent_battle_user.defence_percent).to equal(100)
      end
    end
  end
end
