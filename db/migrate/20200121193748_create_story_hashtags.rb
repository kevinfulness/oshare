class CreateStoryHashtags < ActiveRecord::Migration[6.0]
  def change
	create_table :story_hashtags do |t|
		t.belongs_to :story, index: true
		t.belongs_to :hashtag, index: true
		t.timestamps
    end
  end
end
