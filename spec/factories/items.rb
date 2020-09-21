FactoryBot.define do
  factory :item do
    image                 {'staff3.jpg'}
    name                  {"abe"}
    info                  {"商品説明です.2010年頃に1万円で購入したジャケットです。ライトグレーで傷はありません。あわせやすいのでおすすめです。"} 
    category_id           {'2'}
    condition_id          {'2'}
    price                 {'5000'}
    delivery_fee_id       {'2'}
    area_id               {'28'}
    date_of_shipment      {'2'}
  end
end
