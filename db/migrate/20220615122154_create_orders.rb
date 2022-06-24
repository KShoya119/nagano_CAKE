class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :postcode_mail, null: false
      t.string :address_mail, null: false
      t.string :name_mail, null: false
      t.integer :pay_method, null: false
      t.integer :is_active
      t.integer :postage, null: false
      t.integer :total, null: false

      t.timestamps
    end
  end
end
