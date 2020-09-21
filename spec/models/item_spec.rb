require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('/staff3.jpg')
  end

  describe '商品出品機能' do
    context '新規登録がうまくいかないとき'
    it '画像が一枚でもなと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名がないと出品できない' do
      @item.name = " "
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明がないと出品できない' do
      @item.info = " "
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end
    it 'カテゴリーの情報がないと出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end
    it '商品の状態についての情報がないと出品できない' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
    end
    it '配送料の負担について情報がないと出品できない' do
      @item.delivery_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank", "Delivery fee is not a number")
    end
    it '発送元の地域について情報がないと出品できない' do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank", "Area is not a number")
    end
    it '発送までの日数について情報がないと出品できない' do
      @item.date_of_shipment = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Date of shipment can't be blank", "Date of shipment is not a number")
    end
    it '価格についての情報がないと出品できない' do
      @item.price =''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price is invalid")
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = '99,999,999'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it '販売価格は半角英数のみ入力すること' do
      @item.price = '００００００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
