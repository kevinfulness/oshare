class StoryHashtag < ApplicationRecord
	belongs_to :story
	belongs_to :hashtag
end
