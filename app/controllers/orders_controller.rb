class OrdersController < ApplicationController
  # GET customers/1/orders
  # GET customers/1/orders.json
  def index
    @customer = Customer.find(params[:customer_id])
    @orders = @customer.orders

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @orders }
    end
  end

  # GET customers/1/orders/1
  # GET customers/1/orders/1.json
  def show
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @order }
    end
  end

  # GET customers/1/orders/new
  # GET customers/1/orders/new.json
  def new
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @order }
    end
  end

  # GET customers/1/orders/1/edit
  def edit
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])
  end

  # POST customers/1/orders
  # POST customers/1/orders.json
  def create
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.build(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to([@order.customer, @order], :notice => 'Order was successfully created.') }
        format.json { render :json => @order, :status => :created, :location => [@order.customer, @order] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT customers/1/orders/1
  # PUT customers/1/orders/1.json
  def update
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to([@order.customer, @order], :notice => 'Order was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE customers/1/orders/1
  # DELETE customers/1/orders/1.json
  def destroy
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to customer_orders_url(@customer) }
      format.json { head :ok }
    end
  end
end
