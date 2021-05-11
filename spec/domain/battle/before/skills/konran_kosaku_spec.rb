require 'rails_helper'

RSpec.describe Battle::Before::Skills::KonranKosaku, type: :model do
  describe '混乱工作' do
    let(:soldier_num) { 65 }
    let(:soldier) { build_stubbed(:soldier, num: soldier_num) }
    let(:user) { build_stubbed(:user, soldier: soldier) }
    let(:opponent_strength) { 100 }
    let(:opponent_user) { build_stubbed(:user, strength: opponent_strength) }
    let(:before_battle_user) { Battle::Before::DefenceUser.new(user) }
    let(:before_battle_opponent_user) { Battle::Before::AttackUser.new(opponent_user) }
    let(:konran_kosaku) { Battle::Before::Skills::KonranKosaku.new(before_battle_user, before_battle_opponent_user) }
    context '守備側のとき' do
      context '相手の兵数＜自軍の兵数×５' do
        it '攻撃側の陣形が無効化されること' do
          allow(konran_kosaku).to receive(:hit?).and_return(true)
          konran_kosaku.handle
          expect(before_battle_opponent_user.formation).to be_nil
        end
      end
      context '相手の兵数≧自軍の兵数×５' do
        let(:soldier_num) { 13 }
        it '攻撃側の陣形が無効化されないこと' do
          allow(konran_kosaku).to receive(:hit?).and_return(true)
          konran_kosaku.handle
          expect(before_battle_opponent_user.formation).to_not be_nil
        end
      end
    end
    context '守備側ではないとき' do
      let(:before_battle_user) { Battle::Before::AttackUser.new(user) }
      let(:before_battle_opponent_user) { Battle::Before::DefenceUser.new(opponent_user) }
      it '攻撃側の陣形が無効化されないこと' do
        allow(konran_kosaku).to receive(:hit?).and_return(true)
        konran_kosaku.handle
        expect(before_battle_opponent_user.formation).to_not be_nil
      end
    end
  end
end
