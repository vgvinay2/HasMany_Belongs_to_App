class OrdersController < ApplicationController

  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :get_customer

  def index
    @orders = @customer.orders.search(params[:keyword])
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
    if @order.save
       redirect_to [@customer, @order], notice: 'Order was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @order = @customer.orders.find(params[:id])
    if @order.update(order_params)
      redirect_to [@customer, @order], notice: 'Order was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @order = @customer.orders.find(params[:id] )
    @order.destroy
    redirect_to customer_orders_path, notice: 'Order was successfully destroyed.'
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
