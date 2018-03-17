class FriendshipsGroupsController < ApplicationController
	def create
		@group = Group.find(params[:group_id])
		@friend = User.find_by name: params[:friendName]
		@friendship = Friendship.where("user_id = ? AND friend_id = ?", current_user.id, @friend.id).first
		@join = FriendshipsGroup.new(:friendship_id => @friendship.id, :group_id => params[:group_id])
		@data = User.find(@friendship.friend_id).name
		@ID = User.find(@friendship.friend_id).id
		@img = User.find(@friendship.friend_id).uimage (:thumb)
		puts @img
		respond_to do |format|
			if @join.save
    			format.json { render json: {"str": @data, "fid": @ID, "ImgSrc": @img } }
      		end
  		end
	end


	def destroy
    	@friendship = Friendship.where("user_id = ? AND friend_id = ?", current_user.id, params[:id]).first
    	puts @friendship.id
    	puts params[:gid]
    	@join = FriendshipsGroup.where("friendship_id = ? AND group_id = ?", @friendship.id, params[:gid]).first
    	puts @join.friendship_id
    	puts @join.group_id
		respond_to do |format|
			if @join.destroy
    			format.json { render json: {"fid": @friendship.friend_id} }
      		end
  		end
  	end
end
