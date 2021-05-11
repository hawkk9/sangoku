require 'rails_helper'

RSpec.describe Battle::After::Skills::Okyu, type: :model do
  describe '幻影' do
    let(:user) { build_stubbed(:user, leadership: 100) }
    let(:opponent_user) { build_stubbed(:user) }
    let(:battling_user) { Battle::Battling::AttackUser.new(user) }
    let(:battling_opponent_user) { Battle::Battling::DefenceUser.new(opponent_user) }
    let!(:genei) { Battle::Battling::Skills::Okyu.new(battling_user, battling_opponent_user) }
    context '発動時' do
      it '相手の攻撃を無効化すること' do
        allow(genei).to receive(:hit?).and_return(true)
        genei.handle
        expect(battling_user.shut_out_normal_attack).to be true
      end
    end
    context '非発動時' do
      it '相手の攻撃が無効化されないこと' do
        allow(genei).to receive(:hit?).and_return(false)
        genei.handle
        expect(battling_user.shut_out_normal_attack).to be false
      end
    end
  end
end

