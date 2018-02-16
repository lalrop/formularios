class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.integer :cod
      t.string :detail
      t.string :category
      t.integer :value
      t.integer :discount
      t.integer :tax
      t.float :total

      t.timestamps
    end
  end
end
