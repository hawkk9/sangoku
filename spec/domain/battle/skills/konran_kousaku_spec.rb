require 'rails_helper'

RSpec.describe Battle::Skills::KonranKousaku, type: :model do
  describe '不意打ち' do
    let(:user) { build_stubbed(:user) }
    let(:opponent_user) { build_stubbed(:user, strength: opponent_strength) }
    let(:before_battle_user) { Battle::BeforeBattleUser.new(user) }
    let(:before_battle_opponent_user) { Battle::BeforeBattleUser.new(opponent_user) }
    let(:konran_kousaku) {Battle::Skills::KonranKousaku.new(before_battle_user, before_battle_opponent_user)}
    let(:opponent_strength) { 100 }
    context '混乱工作発動時' do
      it '攻撃側の陣形が無効化されること' do
        konran_kousaku.handle
        expect(before_battle_opponent_user.formation).to be_nil
      end
    end
  end
end
