FactoryBot.define do
  factory :user_orders do
    user_id               { 1 }
    item_id               { 1 }
    postal_code           {'123-4567'}
    area_id               { 4 }
    city                  {"大阪市"}
    house_number          {"青山1-11"}
    phone_number          { "09012345678" }
    number                { 1111111111 }
    exp_month             { 3 }
    exp_year              { 23 }
    cvc                   { 123 }

  end
end
