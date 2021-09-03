class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.integer :price
      t.string :blend_coffee
      t.string :origin
      t.date :sale_date
      t.integer :amount

      t.timestamps
    end
  end
end
