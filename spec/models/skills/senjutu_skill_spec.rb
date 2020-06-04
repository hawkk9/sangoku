require 'rails_helper'

RSpec.describe Skills::SenjutuSkill, type: :model do
  describe '不意打ち' do
    let(:country) { create(:country) }
    let(:town) { create(:town, country: country) }
    let(:user) { Battle::BattleUser.new(create(:user, country: country, town: town)) }
    let(:opponent_country) { create(:country) }
    let(:opponent_town) { create(:town, country: opponent_country) }
    let(:opponent_user) { Battle::BattleUser.new(create(:user, country: opponent_country, town: opponent_town)) }
    let(:battle_context) { Battle::BattleContext.new }
    it '' do
      Skills::SenjutuSkill.fuiuti_before_battle_effect(user, opponent_user, battle_context)
      expect(opponent_user.attack_percent).to equal(-5)
    end
  end
end
