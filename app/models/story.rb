class Story < ApplicationRecord
	belongs_to :user
	has_one_attached :image
	has_one_attached :video
	has_many :story_hashtags
	has_many :hashtags, through: :story_hashtags
	after_commit :create_hashtags, on: :create

	def create_hashtags
		extract_hashtag_hashtags.each do |hashtag|
			hashtags.create(hashtag: hashtag)
		end
	end

	def extract_hashtag_hashtags
		caption.to_s.scan(/#\w+/).map{|hashtag| hashtag.gsub("#", "")} 
	end
end
