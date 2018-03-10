class JoinedsController < ApplicationController
  before_action :set_joined, only: [:show, :edit, :update, :destroy]

  # GET /joineds
  # GET /joineds.json
  def index
    @joineds = Joined.all
  end

  # GET /joineds/1
  # GET /joineds/1.json
  def show
  end

  # GET /joineds/new
  def new
    @joined = Joined.new
  end

  # GET /joineds/1/edit
  def edit
  end

  # POST /joineds
  # POST /joineds.json
  def create
    @joined = Joined.new(joined_params)

    respond_to do |format|
      if @joined.save
        format.html { redirect_to @joined, notice: 'Joined was successfully created.' }
        format.json { render :show, status: :created, location: @joined }
      else
        format.html { render :new }
        format.json { render json: @joined.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /joineds/1
  # PATCH/PUT /joineds/1.json
  def update
    respond_to do |format|
      if @joined.update(joined_params)
        format.html { redirect_to @joined, notice: 'Joined was successfully updated.' }
        format.json { render :show, status: :ok, location: @joined }
      else
        format.html { render :edit }
        format.json { render json: @joined.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /joineds/1
  # DELETE /joineds/1.json
  def destroy
    @joined.destroy
    respond_to do |format|
      format.html { redirect_to joineds_url, notice: 'Joined was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joined
      @joined = Joined.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def joined_params
      params.require(:joined).permit(:order_id, :user_id)
    end
end
