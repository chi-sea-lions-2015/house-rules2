class CreateCommunalItems < ActiveRecord::Migration
  def change
    create_table :communal_items do |t|
      t.string :name
      t.string :brand
      t.integer :quantity
      t.references :house, index: true, foreign_key: true
      t.string :stock_level

      t.timestamps null: false
    end
  end
end
