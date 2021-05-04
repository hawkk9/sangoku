require 'rails_helper'

RSpec.describe User, type: :model do
  pending do
    let!(:town) { create(:town) }
    let(:user) { create(:user) }

    describe 'ステータス' do
      it '攻撃力が正しく計算されること' do
        expect(user.attack).to eq(97.5)
      end
      it '攻撃力が正しく計算されること' do
        expect(user.defence).to eq(98.5)
      end
    end
  end
end
