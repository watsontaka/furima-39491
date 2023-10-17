require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe '購入情報アソシエーション' do

    context '保存できるとき' do
      it '正常に保存できるとき' do
        expect(@purchase).to be_valid
      end
    end

    context '保存できないとき' do
      it 'userが紐付いていないと保存できない' do
        @purchase.user = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User must exist")
      end
      it 'itemが紐付いていないと保存できない' do
        @purchase.item = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item must exist")
      end
    end

  end
end