class SearchController < ApplicationController
	before_action :authenticate_user!
	def index
		if params[:query].start_with?('#')
			query = params[:query].gsub('#', '')
			@posts = Post.joins(:hashtags).where(hashtags: {hashtag: query})
		else
			@posts = Post.where("caption like ?", "%#{params[:query]}%")
		end
	end
end
