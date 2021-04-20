require 'rails_helper'

RSpec.describe Battle::Skills::Fuiuti, type: :model do
  describe '不意打ち' do
    it '守備側の攻守が-5%されること' do
      fuiuti = Battle::Skills::Fuiuti.new(nil, nil)
      fuiuti.handle
      expect(fuiuti.handle).to equal(100)
    end
  end
end
