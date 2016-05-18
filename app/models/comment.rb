class Comment < ActiveRecord::Base
	attr_accesssible :body, :commenter, :micropost 
  belongs_to :micropost
  belongs_to :user
end
