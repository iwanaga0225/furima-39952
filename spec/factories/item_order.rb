FactoryBot.define do
  factory :item_order do
    token            {'tok_abcdefghijk00000000000000000'}
    postal_code      {'123-4567'}
    delivery_area_id {23}
    city             {'名古屋市'}
    street           {'1-1-1'}
    building         {'建物ビル'}
    phone            {'09011112222'}
  end
end