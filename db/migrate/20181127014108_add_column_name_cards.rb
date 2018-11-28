class AddColumnNameCards < ActiveRecord::Migration[5.2]
  def change
    add_column :name_cards, :image, :text
  end
end
