class Hashtag < ApplicationRecord
	has_many :story_hashtags
	has_many :stories, through: :story_hashtags
end
