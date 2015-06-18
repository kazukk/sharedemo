class RemoveFieldsToOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :price, :string
    remove_column :orders, :decimal, :string
  end
end
