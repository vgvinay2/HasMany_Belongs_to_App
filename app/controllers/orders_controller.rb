class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :get_customer

  def index
    @orders = @customer.orders
  end

  def show
    @order = @customer.orders.find(params[:id])
  end

  def new
    @order = @customer.orders.build
  end

  def edit
  end

  def create
    @order = @customer.orders.new(order_params)
    @order.save
    redirect_to [@customerd, @order]
  end

  def update
   @order = @customer.orders.find(params[:id])
   @order = @order.update(order_params)
    if @order
      redirect_to customer_order_path(@order), notice: 'Order was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url
  end

  def get_customer
    @customer = Customer.find(params[:customer_id])
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.required(:order).permit(:name)
  end

end
