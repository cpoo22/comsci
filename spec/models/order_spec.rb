require 'spec_helper'

describe Order do


  before(:each) do
    @order_attrs = {
        :discount => 0,
        :order_date => Time.now,
        :total_price => 1,
        :total_weight => 1
    }
  end

  describe "attributes" do
    it { should respond_to :discount }
    it { should respond_to :order_date }
    it { should respond_to :total_price }
    it { should respond_to :total_weight }
  end

  describe "methods" do
    it { should respond_to :calc_order_price }
    it { should respond_to :calc_order_weight }
    it { should respond_to :tot_me_up }
    it { should respond_to :update_products }
  end

  describe "validations" do

    it "should be valid" do
      Order.new(@order_attrs).should be_valid
    end

    it "should create a valid instance given valid attibutes" do
      Order.create!(@order_attrs)
    end

    it "should require most attributes" do
      [:order_date, :total_price, :total_weight].each do |item|
        expect { Order.create!(@order_attrs.merge(item => "")) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    it "should have a positive total_price" do
      expect {Order.create!(@order_attrs.merge(:total_price => "-1"))}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should have a positive total_weight" do
      expect {Order.create!(@order_attrs.merge(:total_weight => "-1"))}.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

  describe "associations" do
    it { should respond_to :order_items }
    it { should respond_to :customer }
  end

  describe "when updating order products" do

    let (:order_item_1) do
      {
          :product_code => '5000',
      }
    end

    let (:order_item_2) do
      {
          :product_code => '5001',
      }
    end

    let (:order_item_3) do
      {
          :product_code => nil,
      }
    end

    let(:product_attr1){
       {
         :code => '5000',
         :name => 'Becks',
         :weight => 1,
         :price => 10,
       }
     }

    let(:product_attr2){
       {
         :code => '5001',
         :name => 'Silver',
         :weight => 2,
         :price => 20.89,
       }
     }

    before(:each) do
      @order_attrs[:order_items_attributes] = [order_item_1, order_item_2, order_item_3]
      @order = Order.new(@order_attrs.merge({:total_price => nil, :total_weight => nil}))
    end


    context "update products" do
      it "should update the order item products correctly" do
        product = Product.new product_attr1
        Product.stubs(:find_by_code).with("5000").returns(product)
        product = Product.new product_attr2
        Product.stubs(:find_by_code).with("5001").returns(product)
        Product.stubs(:find_by_code).with(nil).returns(nil)
        @order.update_products
        @order.order_items[0].product_name.should == "Becks"
        @order.order_items[0].unit_price.should == 10
        @order.order_items[0].weight.should == 1
        @order.order_items[1].product_name.should == "Silver"
        @order.order_items[1].unit_price.should == 20.89
        @order.order_items[1].weight.should == 2
      end
    end


  end

  describe "when totaling orders" do
    let (:order_item_1) do
      {
          :discount => 0,
          :product_code => '5000',
          :product_name => 'Becks',
          :quantity => 1,
          :weight => 1,
          :unit_price => 1,
      }
    end
    let (:order_item_2) do
      {
          :discount => 0,
          :product_code => '5001',
          :product_name => 'Clarks',
          :quantity => 10,
          :weight => 10,
          :unit_price => 56765,
      }
    end

    before(:each) do
      @order_attrs[:order_items_attributes] = [order_item_1, order_item_2]
      @order = Order.new(@order_attrs.merge({:total_price => nil, :total_weight => nil}))
    end

    it "should have 2 order items" do
      @order.order_items.size.should == 2
    end

    context "total_price" do
      it "should be correct total price" do
        @order.calc_order_price
        @order.total_price.should == 567651
      end
    end

    context "total_weight" do
      it "should be correct total weight" do
        @order.calc_order_weight
        @order.total_weight.should == 101
      end
    end

    context "tot_me_up" do
      it "should total the whole order" do
        @order.tot_me_up
        @order.total_price.should == 567651
        @order.total_weight.should == 101
      end
    end

  end
end
