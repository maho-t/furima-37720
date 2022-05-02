require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe '商品購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_order = FactoryBot.build(:purchase_order, user_id: @user, item_id: @item)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_order).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @purchase_order.building = ''
        expect(@purchase_order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @purchase_order.postal_code = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_order.postal_code = '1234567'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_order.prefecture_id = 1
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @purchase_order.municipality = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @purchase_order.house_number = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_order.phone_number = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数字でないと保存できないこと' do
        @purchase_order.phone_number = '１２３４５６７８９０１'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'phone_numberは10桁以上11桁以内の半角数字でないと保存できないこと' do
        @purchase_order.phone_number = '123456789'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number is too short")
      end
      it 'phone_numberは10桁以上11桁以内の半角数字でないと保存できないこと' do
        @purchase_order.phone_number = '123456789012'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number is too short")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_order.user_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_order.item_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @purchase_order.token = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
