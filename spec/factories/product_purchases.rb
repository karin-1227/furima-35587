FactoryBot.define do
  factory :product_purchase do
    postal_code    {'111-1111'}
    prefecture_id  {1}
    municipality   {'あ'}
    address        {'あ'}
    building_name  {'い'}
    phone_number   {12312341234}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
