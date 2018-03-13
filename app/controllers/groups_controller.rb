class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
    @userGroups = Group.where("user_id = ? ", current_user.id)
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    friends = []
    @group.friendships.each do |friendship|
      friends.push(User.find(friendship.friend_id).name)
    end
    puts friends
    render json: {"list": friends}
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(:name => params[:name], :user_id => params[:user_id])
    respond_to do |format|
      if @group.save
        format.json { render json: {"str": @group.name, "id": @group.id} }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end
end
