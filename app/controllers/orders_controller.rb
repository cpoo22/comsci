class OrdersController < ApplicationController
  def index
    @customer = Customer.find(params[:customer_id])
    @orders = @customer.orders
  end

  def show
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])
  end

  def new
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.build
    5.times do
      order = @order.order_items.build
      order.quantity = 1
      order.discount = 0
    end
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.build(params[:order])
    tidy_order @order
    if !params[:preview_button] && @order.save
      redirect_to([@order.customer, @order], :notice => 'Order was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])

    if @order.update_attributes(params[:order])
      redirect_to([@order.customer, @order], :notice => 'Order was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])
    @order.destroy

    redirect_to customer_orders_url(@customer)
  end

  def tidy_order order
    order.update_products
    order.tot_me_up
  end
end
