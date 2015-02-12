class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @customer = Customer.find(params[:customer_id])
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @customer = Customer.find(params[:customer_id])
    @order = Order.find(params[:id])
  end

  # GET /orders/new
  def new
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.build
  end

  # GET /orders/1/edit
  def edit
    @customer = Customer.find(params[:customer_id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.build(order_params)
    @order.save
    redirect_to customer_order_path(@customer.id, @order.id)
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
      params.required(:order).permit(:name)
   end

   def show_customer_params
     params.required(:id)
   end

end
