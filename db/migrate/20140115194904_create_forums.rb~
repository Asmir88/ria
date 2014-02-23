class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
      t.string :category
      t.text :description
      t.integer :last_topic_id
      t.integer :author_id
      t.integer :last_poster_id 
      t.datetime :last_post_at
      t.timestamps
    end
  end
end
