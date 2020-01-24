class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :image
      t.text :caption
      t.integer :user_id
      
      t.timestamps
    end
  end
end
