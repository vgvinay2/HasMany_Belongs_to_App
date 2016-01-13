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
    @order = @customer.orders.build(order_params)
    @order.save
    redirect_to customer_order_path(@customer.id, @order.id)
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
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

  def show_customer_params
    params.required(:id)
  end

end
