class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.search(params[:keyword])
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to @customer, notice: 'Customer was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.required(:customer).permit(:name, :address, :city, :status)
  end

end
