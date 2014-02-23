class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :hashed_password
      t.string :salt
      
      #t.string :image_url
      
      t.string :pic_file_name
      t.string :pic_content_type
      t.integer :pic_file_size
      t.datetime :pic_updated_at 
      
      t.string :email    
      t.string :role           
      t.timestamps
    end
  end
end
