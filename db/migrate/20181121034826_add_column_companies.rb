class AddColumnCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :comment, :references
  end
end
