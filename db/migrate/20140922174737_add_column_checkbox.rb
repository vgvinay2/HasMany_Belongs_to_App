class AddColumnCheckbox < ActiveRecord::Migration
  def change
  add_column :customers, :status,:boolean   

  end
end
