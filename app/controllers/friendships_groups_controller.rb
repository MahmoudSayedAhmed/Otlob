class FriendshipsGroupsController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
		@group = Group.find(params[:group_id])
		@friend = User.find_by name: params[:friendName]
		@friendship = Friendship.where("user_id = ? AND friend_id = ?", current_user.id, @friend.id).first
		@join = FriendshipsGroup.new(:friendship_id => @friendship.id, :group_id => params[:group_id])
		@friendships = @group.friendships
		respond_to do |format|
			if @join.save
    			format.json { render json: @friendships }
      			format.js { render "file"}
      		end
  		end
	end
end
