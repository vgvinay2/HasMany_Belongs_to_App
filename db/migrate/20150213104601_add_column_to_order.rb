class AddColumnToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :updated_by, :integer
    add_column :orders, :created_by, :integer
  end
end
