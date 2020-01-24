class UsersController < ApplicationController
before_action :authenticate_user!
before_action :set_user, only: [:show, :edit, :update, :destroy]
authorize_resource

	def show
		@stories = @user.stories.order(created_at: :desc)
		if current_user.friends.include?(@user)
			@conversation = ConversationHelper.find_or_create_conversation(params, current_user, @user)
		end
	end

	def edit
		@user = current_user.id
		@user = User.find(params[:id])
	end

	def update
		if current_user.update(user_params)
			flash[:success] = "Nice, your details have been updated!"
			redirect_to current_user
		else
			flash[:success] = "Dang, your details couldn't be updated"
			redirect_to current_user
		end
	end

	def current_user_home
		redirect_to current_user
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :firstname, :website, :bio, :email, :avatar)
	end

end