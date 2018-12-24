class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :event, foreign_key: true
      t.string :name, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
