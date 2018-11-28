class AddDetailsToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :log_user, foreign_key: true
  end
end
