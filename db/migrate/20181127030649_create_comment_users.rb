class CreateCommentUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_users do |t|
      t.references :user, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
