require 'rails_helper'

describe UserOrders do
  before do
    @user_orders = FactoryBot.build(:user_orders)
  end

  describe '商品購入機能' do
    context '商品購入がうまく行く時' do
      it '全て正常な数値が入っている' do
        expect(@user_orders).to be_valid
      end
    end

    context '商品購入がうまくいかない時'
    it 'tokenが存在しないと購入できない' do
      @user_orders.token = nil
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと購入できない' do
      @user_orders.postal_code = ""
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'ハイフンが含まれないと購入できない' do
      @user_orders.postal_code = "1234567"
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include("Postal code is invalid")
    end
    it 'area_idが空だと購入できない' do
      @user_orders.area_id = nil
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include("Area can't be blank")
    end
    it 'area_idが1の場合購入できない' do
      @user_orders.area_id = 1
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include()
    end
    it 'cityが空だと購入できない' do
      @user_orders.city = ""
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと購入できない' do
      @user_orders.house_number = ""
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空だと購入できない' do
      @user_orders.phone_number = ""
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include("Phone number is invalid")
    end
    it '11桁以上だと購入できない' do
      @user_orders.phone_number = "111111111111"
      @user_orders.valid?
      expect(@user_orders.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
