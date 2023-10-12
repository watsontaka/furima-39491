require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '保存できるとき' do
      it '正常に保存できるとき' do
        expect(@item).to be_valid
      end
    end

    context '保存できない' do
      it 'imageが空では保存できない' do
        @item.image = nil
        expect(@item.errors.full_messages).to include
      end

      it 'item_nameが空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'explainが空では保存できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end

      it 'category_idが[---]では保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'quality_idが[---]では保存できない' do
        @item.quality_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Quality must be other than 1')
      end

      it 'cost_idが[---]では保存できない' do
        @item.cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost must be other than 1')
      end

      it 'region_idが[---]では保存できない' do
        @item.region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Region must be other than 1')
      end

      it 'period_idが[---]では保存できない' do
        @item.period_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Period must be other than 1')
      end

      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが300未満では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが10,000,000では保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'priceが全角数字だと保存できない' do
        @item.price = '１０９３０'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが半角英字だと保存できない' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが全角英字だと保存できない' do
        @item.price = 'AAAAA'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
