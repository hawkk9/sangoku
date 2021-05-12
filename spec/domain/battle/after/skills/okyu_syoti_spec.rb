require 'rails_helper'

RSpec.describe Battle::After::Skills::OkyuSyoti, type: :model do
  describe '応急処置' do
    let(:user) { build_stubbed(:user, leadership: 100) }
    let(:opponent_user) { build_stubbed(:user) }
    let(:after_battle_user) { Battle::After::AttackUser.new(user) }
    let(:after_battle_opponent_user) { Battle::After::DefenceUser.new(opponent_user) }
    let!(:okyu_syoti) { Battle::After::Skills::OkyuSyoti.new(after_battle_user, after_battle_opponent_user) }
    context '発動時' do
      it '倒された兵を回復すること' do
        after_battle_user.killed_soldier_count = 65
        allow(okyu_syoti).to receive(:hit?).and_return(true)
        allow(okyu_syoti).to receive(:recover_percent).and_return(50)

        before_soldier_num = after_battle_user.soldier.num
        okyu_syoti.handle
        expect(after_battle_user.soldier.num).to be > before_soldier_num
      end
    end
    context '非発動時' do
      it '倒された兵が回復されないこと' do
        after_battle_user.killed_soldier_count = 65
        allow(okyu_syoti).to receive(:hit?).and_return(false)
        allow(okyu_syoti).to receive(:recover_percent).and_return(50)

        before_soldier_num = after_battle_user.soldier.num
        okyu_syoti.handle
        expect(after_battle_user.soldier.num).to equal before_soldier_num
      end
    end
  end
end

