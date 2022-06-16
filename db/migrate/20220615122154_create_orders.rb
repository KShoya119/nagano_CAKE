class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :postcode_mail
      t.string :address_mail
      t.string :name_mail
      t.integer :pay_method
      t.integer :is_active
      t.integer :postage
      t.integer :total

      t.timestamps
    end
  end
end
