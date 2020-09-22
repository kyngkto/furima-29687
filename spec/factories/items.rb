FactoryBot.define do
  factory :item do
    name                  {"abe"}
    info                  {"商品説明です.2010年頃に1万円で購入したジャケットです。ライトグレーで傷はありません。あわせやすいのでおすすめです。"} 
    category_id           {3}
    condition_id          {3}
    price                 {5000}
    delivery_fee_id       {3}
    area_id               {28}
    date_of_shipment_id   {2}
  association :user
  end
end
