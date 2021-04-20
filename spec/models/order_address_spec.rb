require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order = FactoryBot.build(:order)
    @order_address = FactoryBot.build(:order_address, user_id: @order.user, item_id: @order.item)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'postal_code,prefecture_id,city,address_number,phone_number,tokenがあれば購入できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'postal_codeが空だと購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンなしだと購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idが空だと購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1だと購入できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空だと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'address_numberが空だと購入できない' do
        @order_address.address_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address number can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁より大きい数字だとと購入できない' do
        @order_address.phone_number = '1234567891011'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'tokenが空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
