class CommentsController < ApplicationController
	def create
		@micropost = MicroPost.find(params[:micropost_id])
		@comment = @micropost.comments.create(params[:comment])
		redirect_to comment_path
	end
end
