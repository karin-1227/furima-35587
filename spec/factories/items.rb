FactoryBot.define do
  factory :item do
    item_name          {'サンプル'}
    description        {'いいもの'}
    category_id        {1}
    state_id           {1}
    shipping_charge_id {1}
    prefecture_id      {1}
    day_to_ship_id     {1}
    price              {1000}
    association :user 
    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end
