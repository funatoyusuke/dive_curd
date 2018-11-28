class AddNameToLogUser < ActiveRecord::Migration[5.2]
  def change
    add_column :log_users, :name, :string
  end
end
