class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /orders
  # GET /orders.json

  def sales
    @orders = Order.all.where(seller: current_user).order("created_at DESC")
  end

  def purchases
    @orders = Order.all.where(buyer: current_user).order("created_at DESC")
  end

  def dashboard
    @purchases = Order.all.where(buyer: current_user).order("created_at DESC")
    @purchases_num = @purchases.group('date(orders.created_at)').count   
    @purchases_amount = @purchases.group('date(orders.created_at)').sum(:price)



    @orders = Order.all.where(seller: current_user).order("created_at DESC")    
    @orders_num = @orders.group('date(orders.created_at)').count   
    @orders_amount = @orders.group('date(orders.created_at)').sum(:price)


  end



  # GET /orders/1
  # GET /orders/1.json

  # GET /orders/new
  def new
    @order = Order.new
    @listing = Listing.find(params[:listing_id])
  end

  
  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @listing = Listing.find(params[:listing_id])
    @seller = @listing.user
    @order.seller_id = @seller.id

    @order.listing_id = @listing.id
    @order.buyer_id = current_user.id
    @order.price = @listing.price

   


    respond_to do |format|
      if @order.save
        #format.html { redirect_to root_url, notice: 'Order was successfully created.' }
        format.html { redirect_to new_transaction_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :city, :state)
    end
end
