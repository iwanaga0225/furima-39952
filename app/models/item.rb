class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_date

  with_options presence: true do
    validates :image
    validates :name
    validates :content
    validates :price
    validates :category_id,        numericality: { other_than: 1, message: "can't be blank"}
    validates :status_id,          numericality: { other_than: 1, message: "can't be blank"}
    validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank"}
    validates :delivery_area_id,   numericality: { other_than: 1, message: "can't be blank"}
    validates :delivery_date_id,   numericality: { other_than: 1, message: "can't be blank"}
  end

  belongs_to :user
  has_one_attached :image

end
