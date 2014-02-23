class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :topic
      t.references :user
      t.text :body

      t.timestamps
    end
    add_index :comments, :topic_id
  end
end
