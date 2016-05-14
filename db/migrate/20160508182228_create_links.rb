class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :product, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
  end
end
