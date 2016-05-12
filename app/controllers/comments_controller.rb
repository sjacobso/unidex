class CommentsController < ApplicationController
	before_action #authenticate the user

	def create
		commentable = commentable_type.constantize.find(commentable_id)
		@comment = Comment.build_from(commentable, current_user.id, body)

		respond_to do |f|
			if @comment.save
				f.html {redirect_to(:back, :notice => 'Comment was successfully added.')}
			else
				f.html {render 'new'}
			end
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id)
	end

	def commentable_type
		comment_params[:commentable_id]
	end

	def commentable_id
		comment_params[:commentable_id]
	end

	def comment_id
		comment_params[:comment_id]
	end

	def body
		comment_params[:body]
	end

end
end