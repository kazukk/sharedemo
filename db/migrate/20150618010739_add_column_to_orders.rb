class AddColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :guid, :string
  end
end
