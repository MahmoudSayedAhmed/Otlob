class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  def setfriends
    @invitedFriend=Array.new
    @he=User.find_by name:  params[:name]
    if @he

    @fri=Friendship.find_by_user_id_and_friend_id(current_user.id,@he.id)

      if @fri
          @invitedFriend.push(@he.id)
          render :json => {
                         :code => 0,
                         :result => @he
                     }
        #send user data
     else
      #not a friend code 1
      render :json => {
                      :code => 1
                     }
        end
    else

    #send not a user in system
    render :json => {
                    :code => 2
                   }
      end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.user_id=current_user.id
    if @invitedFriend
    @invitedFriend.each { |friend|
    Inviteds.create(:order_id => @order.id , :user_id => friend)
    }
   end
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:orderType, :place, :user_id ,:Menu )
    end









end
