class RenameCheckerToPrice < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :checker, :price
  end
end
