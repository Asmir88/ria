class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.references :user
      t.text :body
      t.references :forum

      t.timestamps
    end
  end
end
