require 'rails_helper'

RSpec.describe Battle::Battling::Skills::Genei, type: :model do
  describe '幻影' do
    let(:user) { build_stubbed(:user, leadership: 100) }
    let(:opponent_user) { build_stubbed(:user) }
    let(:battling_user) { Battle::Battling::DefenceUser.new(user) }
    let(:battling_opponent_user) { Battle::Battling::AttackUser.new(opponent_user) }
    let!(:shikabane_hiroi) { Battle::Battling::Skills::Genei.new(battling_user, battling_opponent_user) }
    context '発動時' do
      it '相手の攻撃を無効化すること' do
        before_max_damage = battling_user.max_damage
        battling_opponent_user.soldier.num -= 24
        shikabane_hiroi.handle
        expect(battling_user.max_damage).to be > before_max_damage
      end
    end
  end
end
