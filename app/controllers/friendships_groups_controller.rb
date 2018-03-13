class FriendshipsGroupsController < ApplicationController
	def create
		@group = Group.find(params[:group_id])
		@friend = User.find_by name: params[:friendName]
		@friendship = Friendship.where("user_id = ? AND friend_id = ?", current_user.id, @friend.id).first
		@join = FriendshipsGroup.new(:friendship_id => @friendship.id, :group_id => params[:group_id])
		@data = User.find(@friendship.friend_id).name
		respond_to do |format|
			if @join.save
    			format.json { render json: {"str": @data} }
      		end
  		end
	end
end
