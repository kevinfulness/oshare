class StoriesController < ApplicationController
	before_action :set_story, only: [:show, :edit, :update, :destroy]

	def index
		@stories = Story.order(created_at: :desc)
	end

	def show
		@story = Story.find(params[:id])
	end

	def create
		@story = Story.new(story_params)
		@story.user_id = current_user.id
		if @story.save
			flash[:notice] = "Yuss, your story was saved!"
			redirect_to root_path
		else
			flash[:success] = "Dang, your story was not updated"
			render :new
		end 
	end

	def edit
	end

	def update
		if @story.update_attributes(story_params)
			flash[:success] = "Woo, your story was updated!"
			redirect_to root_path(@story)
		else
			flash[:success] = "Dang, your story was not updated"
			render :edit
		end
	end

	def destroy
		@story = current_user.stories.find(params[:id])
		@story.destroy
		flash[:success] = "Dope, your story was deleted"
		redirect_to user_path(current_user)
	end

	private

	def set_story
		@story = Story.find(params[:id])
	end

	def story_params
		params.require(:story).permit(:image, :video, :caption, :user_id)
	end
end
