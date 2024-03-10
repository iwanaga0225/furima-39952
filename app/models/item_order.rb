class ItemOrder
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :delivery_area_id, :city, :street, :building, :phone

  with_options presence: true do
    #validates :token
    validates :postal_code,      format: { with: /\A\d{3}-\d{4}\z/ }
    validates :delivery_area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :street
    validates :phone,            format: { with: /\A\d{11}\z/ }
  end

  def save
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, delivery_area_id: delivery_area_id,
      city: city, street: street, building: building, phone: phone)
  end

end