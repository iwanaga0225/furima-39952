class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,      null: false
      t.integer    :delivery_area_id, null: false
      t.string     :city,             null: false
      t.string     :street,           null: false
      t.string     :building
      t.string     :phone,            null: false
      t.references :order,            null: false, foreign_key: true
    end
  end
end
