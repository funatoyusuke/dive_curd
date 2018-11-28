class AddCompanyIdToComment < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :company_id, :integer
    #add_reference :comments, :company, foreign_key: true
  end
end
