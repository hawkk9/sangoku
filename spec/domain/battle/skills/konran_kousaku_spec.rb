require 'rails_helper'

RSpec.describe Battle::Skills::KonranKousaku, type: :model do
  describe '不意打ち' do
    let(:user) { build_stubbed(:user) }
    let(:opponent_user) { build_stubbed(:user, strength: opponent_strength) }
    let(:before_battle_user) { Battle::Before::DefenceUser.new(user) }
    let(:before_battle_opponent_user) { Battle::Before::AttackUser.new(opponent_user) }
    let(:konran_kousaku) {Battle::Skills::KonranKousaku.new(before_battle_user, before_battle_opponent_user)}
    let(:opponent_strength) { 100 }
    context '守備側のとき' do
      it '攻撃側の陣形が無効化されること' do
        konran_kousaku.handle
        expect(before_battle_opponent_user.formation).to be_nil
      end
    end
    context '守備側ではないとき' do
      let(:before_battle_user) { Battle::Before::AttackUser.new(user) }
      let(:before_battle_opponent_user) { Battle::Before::DefenceUser.new(opponent_user) }
      it '攻撃側の陣形が無効化されないこと' do
        konran_kousaku.handle
        expect(before_battle_opponent_user.formation).to_not be_nil
      end
    end
  end
end
