require 'rails_helper'

RSpec.describe Battle::Battling::Skills::ShikabaneHiroi, type: :model do
  describe '屍拾い' do
    let(:user) { build_stubbed(:user, intelligence: 100) }
    let(:opponent_user) { build_stubbed(:user) }
    let(:battling_user) { Battle::Battling::DefenceUser.new(user) }
    let(:battling_opponent_user) { Battle::Battling::AttackUser.new(opponent_user) }
    let!(:shikabane_hiroi) { Battle::Battling::Skills::ShikabaneHiroi.new(battling_user, battling_opponent_user) }
    context '倒した兵数が一定数に達した' do
      it '最大ダメージが上昇すること' do
        before_max_damage = battling_user.max_damage
        battling_opponent_user.soldier.num -= 24
        shikabane_hiroi.handle
        expect(battling_user.max_damage).to be > before_max_damage
      end
    end
    context '倒した兵数が一定数に達していない' do
      it '最大ダメージが上昇しないこと' do
        before_max_damage = battling_user.max_damage
        shikabane_hiroi.handle
        expect(battling_user.max_damage).to equal(before_max_damage)
      end
    end
  end
end
