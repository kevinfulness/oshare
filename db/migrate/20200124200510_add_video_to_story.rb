class AddVideoToStory < ActiveRecord::Migration[6.0]
  def change
  	add_column :stories, :video, :string
  end
end
