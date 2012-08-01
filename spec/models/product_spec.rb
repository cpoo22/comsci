require 'spec_helper'

describe Product do

  before(:each) do
    @product_attrs = {
        :code => '5000',
        :name => 'Becks',
        :weight => 1,
        :price => 10,
    }
  end

  describe "attributes" do
    it { should respond_to :code }
    it { should respond_to :name }
    it { should respond_to :weight }
    it { should respond_to :price }
  end

  describe "validations" do
    it "should be valid" do
      Product.new(@product_attrs).should be_valid
    end
    it "should create a valid instance given valid attibutes" do
      Product.create!(@product_attrs)
    end

    it "should require most attributes" do
      [:code, :name, :weight, :price].each do |item|
        expect { Product.create!(@product_attrs.merge(item => "")) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

    it "should have a positive price" do
      expect {Product.create!(@product_attrs.merge(:price => "-1"))}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should have a positive weight" do
      expect {Product.create!(@product_attrs.merge(:weight => "-1"))}.to raise_error(ActiveRecord::RecordInvalid)
    end

  end
end
