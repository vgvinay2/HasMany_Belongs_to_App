class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @customer = Customer.find(params[:customer_id])
    @orders = Order.all
  end

  def show
    @customer = Customer.find(params[:customer_id])
    @order = Order.find(params[:id])
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.build
  end

  def edit
    @customer = Customer.find(params[:customer_id])
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.build(order_params)
    @order.save
    redirect_to customer_order_path(@customer.id, @order.id)
  end

  def update
    respond_to do ormatat|
      if @order.update(order_params)
       ormatat.html { redirect_to @order, notice: 'Order was successfully updated.' }
      else
       ormatat.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private

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
