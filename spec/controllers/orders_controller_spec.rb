require 'spec_helper'


describe OrdersController do
  render_views

  before(:each) do
    @order = FactoryGirl.create(:order)
  end

  describe "basic routing" do
    describe "get" do
      it "index action should render index template" do
        get :index, :customer_id => Customer.first
        response.should be_success
        response.should render_template(:index)
      end

      it "show action should render show template" do
        get :show, :id => @order, :customer_id => @order.customer
        response.should be_success
        response.should render_template(:show)
      end

      it "new action should render new template" do
        get :new, :customer_id => Customer.first
        response.should be_success
        response.should render_template(:new)
      end
    end

    describe "post" do
      it "create action should render new template when model is invalid" do
        Order.any_instance.stubs(:valid?).returns(false)
        post :create, :customer_id => Customer.first
        response.should be_success
        response.should render_template(:new)
      end

      it "create action should redirect when model is valid" do
        Order.any_instance.stubs(:valid?).returns(true)
        post :create, :customer_id => @order.customer
        response.should be_redirect
        response.should redirect_to(customer_order_url(@order.customer, assigns[:order]))
      end

      it "edit action should render edit template" do
        get :edit, :id => @order, :customer_id => @order.customer
        response.should be_success
        response.should render_template(:edit)
      end

      it "update action should render edit template when model is invalid" do
        Order.any_instance.stubs(:valid?).returns(false)
        put :update, :id => @order, :customer_id => @order.customer
        response.should be_success
        response.should render_template(:edit)
      end

      it "update action should redirect when model is valid" do
        Order.any_instance.stubs(:valid?).returns(true)
        put :update, :id => @order, :customer_id => @order.customer
        response.should be_redirect
        response.should redirect_to(customer_order_url(@order.customer, assigns[:order]))
      end

      describe "via preview button" do
        it "create via preview button should render new template" do
          Order.any_instance.stubs(:valid?).returns(true)
          post :create, :customer_id => @order.customer, :preview_button => 'true'
          response.should be_success
          response.should render_template(:new)
        end

        it "update via preview button should render edit template" do
          Order.any_instance.stubs(:valid?).returns(true)
          put :update, :id => @order, :customer_id => @order.customer, :preview_button => 'true'
          response.should be_success
          response.should render_template(:edit)
        end
      end
    end

    it "destroy action should destroy model and redirect to index action" do
      delete :destroy, :id => @order, :customer_id => @order.customer
      response.should be_redirect
      response.should redirect_to(customer_orders_url(@order.customer))
      Order.exists?(1).should be_false
    end

  end

  describe "database changes" do
    it "create action should create a new Order" do
      Order.any_instance.stubs(:valid?).returns(true)
      expect {
        post :create, :customer_id => @order.customer
      }.to change(Order, :count).by 1
    end
  end

  describe "always having an empty row" do
    it "new action should always have exactly one empty item" do
      get :new, :customer_id => Customer.first
      assigns(:order).order_items.size.should == 1
      assigns(:order).order_items[0].should be_empty
    end

    it "create via preview button should have exactly 1 empty item " do
      Order.any_instance.stubs(:valid?).returns(true)
      post :create, :customer_id => @order.customer, :preview_button => 'true'
      only_one_empty_item_row
    end

    it "edit should have exactly 1 empty item " do
      Order.any_instance.stubs(:valid?).returns(true)
      get :edit, :id => @order, :customer_id => @order.customer
      only_one_empty_item_row
    end


    it "update via preview button should have exactly 1 empty item " do
      Order.any_instance.stubs(:valid?).returns(true)
      put :update, :id => @order, :customer_id => @order.customer, :preview_button => 'true'
      only_one_empty_item_row
    end

    it "update via preview button should populate the order item" do
      order = FactoryGirl.create(:order)
      FactoryGirl.create(:product)

      atts = {"order"=>{
          "order_items_attributes"=> {
              "0"=> {
                  "product_code"=>"5000"
              }
          },
          "total_price"=>"140.0",
          "order_date(1i)"=>"2012",
          "order_date(2i)"=>"8",
          "order_date(3i)"=>"22",
          "total_weight"=>"14"
      }}

      put :update, {:customer_id => order.customer, :id => order, "preview_button"=>"Update"}.merge(atts)

      assigns(:order).order_items[0].product_name.should_not be_blank
    end
  end

  it "tidy_order should update order products and total order" do
    order = mock("order")
    order.expects(:update_products)
    order.expects(:tot_me_up)
    controller.tidy_order(order)
  end


  def only_one_empty_item_row
    assigns(:order).order_items.inject(0) do |result, item|
      result += 1 if item.empty?
    end.should == 1
  end
end
