require 'rails_helper'

RSpec.describe Battle::Battling::Skills::ShikabaneHiroi, type: :model do
  pending do
    describe '屍拾い' do
      let(:user) { build_stubbed(:user, soldier: soldier) }
      let(:opponent_strength) { 100 }
      let(:opponent_user) { build_stubbed(:user, strength: opponent_strength) }
      let(:battling_user) { Battle::Battling::DefenceUser.new(user) }
      let(:battling_opponent_user) { Battle::Battling::AttackUser.new(opponent_user) }
      let(:shikabane_hiroi) { Battle::Battling::Skills::ShikabaneHiroi.new(before_battle_user, before_battle_opponent_user) }
      context '' do
        it '守備側の攻守が-5%されること' do
          fuiuti.handle
          expect(before_battle_opponent_user.attack_percent).to equal(95)
          expect(before_battle_opponent_user.defence_percent).to equal(95)
        end
      end
    end
  end
end
