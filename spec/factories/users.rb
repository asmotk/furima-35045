FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { 'aaa111' }
    password_confirmation { password }
    last_name             { '鈴木' }
    first_name            { '太郎' }
    last_name_kana        { 'スズキ' }
    first_name_kana       { 'タロウ' }
    birth_date            { Faker::Date.backward }
  end
end
