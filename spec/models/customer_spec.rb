require 'spec_helper'

describe Customer do

  before(:each) do
    @customer_attrs = {
        :title => 'Mr',
        :first_name => 'Chris',
        :surname => 'Chris',
        :address_1  => '2 Hewly Close',
        :address_2 => 'Fumblton',
        :address_3 => 'Edgware',
        :town => 'Brighton',
        :county => 'West Sussex',
        :country => 'UK',
        :postcode => 'BN1 1AL',
        :daytel => '01273 456789',
        :hometel => '07789987654',
        :email_address => 'test@testing.com'
    }
  end

  describe "attributes" do
    it { should respond_to :title }
    it { should respond_to :first_name }
    it { should respond_to :surname }
    it { should respond_to :address_1 }
    it { should respond_to :address_2 }
    it { should respond_to :address_3 }
    it { should respond_to :town }
    it { should respond_to :county }
    it { should respond_to :country }
    it { should respond_to :postcode }
    it { should respond_to :daytel }
    it { should respond_to :hometel }
    it { should respond_to :email }
  end

  describe "validations" do

    it "should be valid" do
      Customer.new(@customer_attrs).should be_valid
    end

    it "should create a valid instance given valid attibutes" do
      Customer.create!(@customer_attrs)
    end

    it "should require all attributes" do
      [:title, :first_name, :surname, :address_line_1, :town, :county, :country, :postcode].each do |item|
        expect { Customer.create!(@customer_attrs.merge(item => "")) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end

  end

end
