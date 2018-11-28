class AddColumnToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference  :comments, :user, foreign_key: true
    add_reference  :comments, :group, foreign_key: true
    add_reference  :comments, :name_card, foreign_key: true
  end
end
