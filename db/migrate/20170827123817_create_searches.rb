class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :keyword
      t.decimal :max_price
      t.decimal :min_price
      t.string :brand

      t.timestamps
    end
  end
end
