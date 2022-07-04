class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :postcode_mail, null: false
      t.string :address_mail, null: false
      t.string :name_mail, null: false
      t.integer :pay_method
      t.integer :is_active, default: 0
      t.integer :postage, null: false
      t.integer :total, null: false
      t.integer :customer_id, null: false

      t.timestamps
    end
  end
end
