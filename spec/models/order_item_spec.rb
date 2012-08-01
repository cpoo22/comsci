require 'spec_helper'

describe OrderItem do

  before(:each) do
    @order_item_attrs = {
        :discount => 0,
        :items_price => 8,
        :product_code => '5000',
        :product_name => 'Becks',
        :quantity => 1,
        :weight => 1,
        :unit_price => 1,
    }
  end

  describe "attributes" do
    it { should respond_to :discount }
    it { should respond_to :items_price }
    it { should respond_to :product_code }
    it { should respond_to :product_name }
    it { should respond_to :quantity }
    it { should respond_to :weight }
    it { should respond_to :unit_price }
    it { should respond_to :calc_item_total }
  end

  describe "validations" do

    it "should be valid" do
      OrderItem.new(@order_item_attrs).should be_valid
    end

    it "should create a valid instance given valid attibutes" do
      OrderItem.create!(@order_item_attrs)
    end

    it "should require all attributes" do
      [:discount, :product_code, :product_name, :quantity, :weight, :unit_price, :items_price].each do |item|
        expect { OrderItem.create!(@order_item_attrs.merge(item => "")) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    it "should have a positive discount" do
      expect {OrderItem.create!(@order_item_attrs.merge(:discount => "-1"))}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should have a positive unit_price" do
      expect {OrderItem.create!(@order_item_attrs.merge(:unit_price => "-1"))}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should have a positive weight" do
      expect {OrderItem.create!(@order_item_attrs.merge(:weight => "-1"))}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should have a positive items price" do
      expect {OrderItem.create!(@order_item_attrs.merge(:items_price => "-1"))}.to raise_error(ActiveRecord::RecordInvalid)
    end

  end

  describe "associations" do

    before(:each) do
      @order_item = OrderItem.create!(@order_item_attrs)
    end

    it "should have an order attribute" do
      @order_item.should respond_to(:order)
    end

  end

  describe "items price" do

    before(:each) do
      @order_item = OrderItem.new(@order_item_attrs.merge({:items_price => nil}))
    end

    it "should be (quantity * unit price) - discount" do
      @order_item.unit_price = 10
      @order_item.discount = 0
      @order_item.quantity = 1

      @order_item.calc_item_total
      @order_item.items_price.should == 10

      @order_item.unit_price = 11
      @order_item.discount = 0
      @order_item.quantity = 2

      @order_item.calc_item_total
      @order_item.items_price.should == 22

      @order_item.unit_price = 10
      @order_item.discount = 10
      @order_item.quantity = 1

      @order_item.calc_item_total
      @order_item.items_price.should == 9

      @order_item.unit_price = 11
      @order_item.discount = 10
      @order_item.quantity = 2

      @order_item.calc_item_total
      @order_item.items_price.should == 19.8

    end

  end

end
