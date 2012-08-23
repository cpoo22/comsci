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

  describe "methods" do
    it {should respond_to :update_product}
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
      expect { OrderItem.create!(@order_item_attrs.merge(:discount => "-1")) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should have a positive unit_price" do
      expect { OrderItem.create!(@order_item_attrs.merge(:unit_price => "-1")) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should have a positive weight" do
      expect { OrderItem.create!(@order_item_attrs.merge(:weight => "-1")) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should have a positive items price" do
      expect { OrderItem.create!(@order_item_attrs.merge(:items_price => "-1")) }.to raise_error(ActiveRecord::RecordInvalid)
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
      data_sets = [[10, 0, 1, 10], [11, 0, 2, 22], [10, 10, 1, 9], [11, 10, 2, 19.8], [456465, 0, 1, 456465], [23, 23, 0, 0]]

      data_sets.each do |data|
        @order_item.unit_price = data[0]
        @order_item.discount = data[1]
        @order_item.quantity = data[2]

        @order_item.calc_item_total
        @order_item.items_price.should == data[3]
      end
    end

  end

  describe "update_products" do

    before(:each) do
      @order_item = OrderItem.new({:product_code => '5000', :quantity => 1 })
    end

    let(:product_attr){
      {
        :code => '5000',
        :name => 'Becks',
        :weight => 1,
        :price => 10,
      }
    }

    it "should update the product name, unit price and weight" do
      product = Product.new product_attr
      Product.stubs(:find_by_code).with("5000").returns(product)

      @order_item.update_product
      @order_item.product_name.should == "Becks"
      @order_item.unit_price.should == 10
      @order_item.weight.should == 1
    end

    it "should not update the unit price if present" do
      product = Product.new product_attr
      @order_item.unit_price = 300
      Product.stubs(:find_by_code).with("5000").returns(product)

      @order_item.update_product
      @order_item.unit_price.should == 300
    end

  end


end
