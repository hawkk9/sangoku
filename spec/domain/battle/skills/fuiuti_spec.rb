require 'rails_helper'

RSpec.describe Battle::Skills::Fuiuti, type: :model do
  describe '不意打ち' do
    let(:user) { build_stubbed(:user) }
    let(:opponent_user) { build_stubbed(:user, strength: opponent_strength) }
    let(:before_battle_user) { Battle::BeforeBattleUser.new(user) }
    let(:before_battle_opponent_user) { Battle::BeforeBattleUser.new(opponent_user) }
    let(:fuiuti) {Battle::Skills::Fuiuti.new(before_battle_user, before_battle_opponent_user)}
    let(:opponent_strength) { 100 }
    context '攻撃側の武力が守備側の武力以上の場合' do
      it '守備側の攻守が-5%されること' do
        fuiuti.handle
        expect(before_battle_opponent_user.attack_percent).to equal(95)
        expect(before_battle_opponent_user.defence_percent).to equal(95)
      end
    end
    context '攻撃側の武力が守備側の武力より低い場合' do
      let(:opponent_strength) { 101 }
      it '守備側の攻守が-5%されないこと' do
        fuiuti.handle
        expect(before_battle_opponent_user.attack_percent).to equal(100)
        expect(before_battle_opponent_user.defence_percent).to equal(100)
      end
    end
  end
end
