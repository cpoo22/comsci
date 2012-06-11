require File.dirname(__FILE__) + '/../spec_helper'

describe OrdersController do
  render_views

  before(:each) do
    @order = FactoryGirl.create(:order)
  end

  it "index action should render index template" do
    get :index, :customer_id => Customer.first
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => @order, :customer_id => @order.customer
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new, :customer_id => Customer.first
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Order.any_instance.stubs(:valid?).returns(false)
    post :create, :customer_id => Customer.first
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Order.any_instance.stubs(:valid?).returns(true)
    post :create, :customer_id => @order.customer
    response.should redirect_to(customer_order_url(@order.customer, assigns[:order]))
  end

  it "edit action should render edit template" do
    get :edit, :id => @order, :customer_id => @order.customer
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Order.any_instance.stubs(:valid?).returns(false)
    put :update, :id => @order, :customer_id => @order.customer
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Order.any_instance.stubs(:valid?).returns(true)
    put :update, :id => @order, :customer_id => @order.customer
    response.should redirect_to(customer_order_url(@order.customer, assigns[:order]))
  end

  it "destroy action should destroy model and redirect to index action" do
    delete :destroy, :id => @order, :customer_id => @order.customer
    response.should redirect_to(customer_orders_url(@order.customer))
    Order.exists?(1).should be_false
  end
end
