class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.string :picture_url
      t.references :house_assignment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
