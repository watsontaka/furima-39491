require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '配送先アソシエーション' do
    context '保存できるとき' do
      it '正常に保存できる' do
        expect(@address).to be_valid
      end
    end

    context '保存できない' do
      it 'purchaseが紐づいてないと保存できない' do
        @address.purchase = nil
        @address.valid?
        expect(@address.errors.full_messages).to include('Purchase must exist')
      end
    end
  end
end
