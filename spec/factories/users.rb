FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"ab00000"}
    password_confirmation {"ab00000"}
    first_name            {"阿部"}
    last_name             {"晋三"}
    first_name_kana       {"アベ"}
    last_name_kana        {"シンゾウ"}
    birth_day             {"1998/9/13"}
  end
end