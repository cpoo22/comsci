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
    if params[:save_button] && @order.save
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
    if params[:save_button] && @order.update_attributes(params[:order])
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

  def generate_invoice
    report = ODFReport::Report.new("#{File.expand_path(File.dirname(__FILE__))}/../../templates/invoice.odt") do |r|

      r.add_field "USER_NAME", 'me me'
      r.add_field "ADDRESS", '2 sharon close'


      o1 = OpenStruct.new(item: 'item1', cost: 'cost 1')
      o2 = OpenStruct.new(item: 'item2', cost: 'cost 2')
      h1 = {item: 'item 1', cost: 'cost 1'}
      h2 = {item: 'item 2', cost: 'cost 2'}

      @list_of_items = [h1, h2]

      r.add_table("Items", @list_of_items, :header=>true) do |t|
        t.add_column('ITEM', :item)
        t.add_column('COST', :cost)
      end


    end

    report_file_name = report.generate

    send_file(report_file_name)
  end

end
