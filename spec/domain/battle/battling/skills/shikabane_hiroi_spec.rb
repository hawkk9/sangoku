require 'rails_helper'

RSpec.describe Battle::Battling::Skills::ShikabaneHiroi, type: :model do
  describe '屍拾い' do
    let(:user) { build_stubbed(:user) }
    let(:opponent_user) { build_stubbed(:user) }
    let(:battling_user) { Battle::Battling::DefenceUser.new(user) }
    let(:battling_opponent_user) { Battle::Battling::AttackUser.new(opponent_user) }
    let(:shikabane_hiroi) { Battle::Battling::Skills::ShikabaneHiroi.new(battling_user, battling_opponent_user) }
    context '一定数倒した' do
      it '最大ダメージが上昇すること' do
        shikabane_hiroi.handle
        battling_opponent_user.soldier.num -= 10
        shikabane_hiroi.handle
        expect(battling_user.max_damage).to equal(3)
      end
    end
    context '倒してない' do
      it '最大ダメージが上昇しないこと' do
        shikabane_hiroi.handle
        expect(battling_user.max_damage).to equal(1)
      end
    end
  end
end
