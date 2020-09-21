require 'rails_helper'

describe Item do
  before do
    @item  = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規登録がうまくいかないとき'
    it '画像が一枚でもないと出品できない' do
      @item.imag = ''
      @item.valid?
      expect(@item.error.full_message).to include("Image can't be blank")
    end
    it '商品名がないと出品できない' do
      @item.name = ""
      @item.valid?
      expect(@item.error.full_message).to include("Name can't be blank")
    end
    it '商品の説明がないと出品できない' do
      @item.info = ""
      @item.valid?
      expect(@item.error.full_message).to include("Info can't be blank")
    end
    it 'カテゴリーの情報がないと出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.error.full_message).to include("category can't be blank")
    end
    it '商品の状態についての情報がないと出品できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.error.full_message).to include("condition can't be blank")
    end
    it '配送料の負担について情報がないと出品できない' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.error.full_message).to include("deliver-fee can't be blank")
    end
    it '発送元の地域について情報がないと出品できない' do
      @item.area_id = ''
      @item.valid?
      expect(@item.error.full_message).to include("area can't be blank")
    end
    it '発送までの日数について情報がないと出品できない' do
      @item.date_of_shipment = ''
      @item.valid?
      expect(@item.error.full_message).to include("date-of-shipment can't be blank")
    end
    it '価格についての情報がないと出品できない' do
      @item.price =''
      @item.valid?
      expect(@item.error.full_message).to include("price can't be blank")
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = '99,999,999'
      @item.valid?
      expect(@item.error.full_message).to include("price Price Out of setting range")
    end
    it '販売価格は半角英数のみ入力すること' do
      @item.price = '００００００'
      @item.valid?
      expect(@item.error.full_message).to include('Price Half-width number')
    end
    it
    end
end
