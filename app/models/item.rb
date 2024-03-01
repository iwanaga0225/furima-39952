class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :image,              presence: true
  validates :name,               presence: true
  validates :content,            presence: true
  validates :category_id,        numericality: { other_than: 1, message: "can't be blank"}
  validates :status_id,          numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_area_id,   numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_date_id,   numericality: { other_than: 1, message: "can't be blank"}
  validates :price,              presence: true

  belongs_to :user
  has_one_attached :image

end
