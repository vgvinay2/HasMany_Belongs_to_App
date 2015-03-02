class AddColumnToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :created_by, :integer
    add_column :customers, :updated_by, :integer
  end
end
