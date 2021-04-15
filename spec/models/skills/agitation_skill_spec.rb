require 'rails_helper'

RSpec.describe Skills::SendouSkill, type: :model do
  describe '#keiryaku_before_battle_effect' do
    let(:country) { create(:country) }
    let(:town) { create(:town, country: country) }
    let(:user) { create(:user, town: town) }
    let(:opponent_user) { create(:user, town: town) }
    let(:battle_context) { Battle::BattleContext.new(nil, town) }
    context '攻撃側' do
      it 'ターン数が10増加すること' do
        Skills::SendouSkill::keiryaku_before_battle_effect(user, opponent_user, battle_context, true)
        expect(battle_context.turn_limit).to eq 47
      end
    end
    context '守備側' do
      it 'ターン数が10減少すること' do
        Skills::SendouSkill::keiryaku_before_battle_effect(user, opponent_user, battle_context, false)
        expect(battle_context.turn_limit).to eq 27
      end
    end
  end
end
