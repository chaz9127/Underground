class CreateCustomerPurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_purchases do |t|
      t.references :customer, null: false
      t.references :ticket, null: false

      t.timestamps
    end
  end
end
