class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @costomer = Customer.find(show_customer_params)
    @orders = @costomer.orders
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
    @order.save
    redirect_to :controller => 'orders', :action => 'show', :id =>@order.customer_id
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do ormatat|
      if @order.update(order_params)
       ormatat.html { redirect_to @order, notice: 'Order was successfully updated.' }
       ormatat.json { head :no_content }
      else
       ormatat.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

   def order_params
      params.required(:order).permit(:name, :customer_id)
   end

   def show_customer_params
     params.required(:id)
   end

end
