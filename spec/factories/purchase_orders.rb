FactoryBot.define do
  factory :purchase_order do
    postal_code     { '123-4567' }
    prefecture_id   { 2 }
    municipality    {'東京都'}
    house_number    { '1-1' }
    building        { '東京ハイム' }
    phone_number    { 12345678901 }
    token           { "tok_abcdefghijk00000000000000000" }
  end
end