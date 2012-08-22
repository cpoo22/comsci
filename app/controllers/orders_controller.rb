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
    add_one_item
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])
    add_one_item
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.build(params[:order])
    tidy_order @order
    if !params[:preview_button] && @order.save
      redirect_to([@order.customer, @order], :notice => 'Order was successfully created.')
    else
      add_one_item
      render :action => "new"
    end
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])
    @order.assign_attributes(params[:order])
    tidy_order @order
    if !params[:preview_button] && @order.update_attributes(params[:order])
      redirect_to([@order.customer, @order], :notice => 'Order was successfully updated.')
    else
      add_one_item
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

  def add_one_item
    order = @order.order_items.build
    order.quantity = 1
    order.discount = 0
  end

end
