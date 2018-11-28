class CreateCommentGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_groups do |t|
      t.references :group, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
