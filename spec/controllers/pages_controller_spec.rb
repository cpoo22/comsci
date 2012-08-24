require 'spec_helper'

describe PagesController do
  render_views

  it "get search action should render search template" do
    get :search
    response.should be_success
    response.should render_template(:search)
  end

  it "post search should render search template" do
    post :search
    response.should be_success
    response.should render_template(:search)
  end

  describe "searching" do
    before(:each) do
      FactoryGirl.create(:customer)
      FactoryGirl.create(:product)
    end

    context "for customer" do
      it "should set results" do
        post :search, :search_param => 'doe'
        assigns[:customer_results].should_not be_nil
      end

      it "should find customer on first name (case insensitive)" do
        post :search, :search_param => 'jOhN'
        assigns[:customer_results].values.should include 'John Doe, 22 Sharon Lane, TH78 6YH'
      end

      it "should find customer on last name (case insensitive)" do
        post :search, :search_param => 'dOe'
        assigns[:customer_results].values.should include 'John Doe, 22 Sharon Lane, TH78 6YH'
      end

      it "should find customer on postcode (case insensitive)" do
        post :search, :search_param => 'Th78 6Yh'
        assigns[:customer_results].values.should include 'John Doe, 22 Sharon Lane, TH78 6YH'
      end

      it "should find all customers matching searh param" do
        FactoryGirl.create(:customer, first_name: 'Jane')
        post :search, :search_param => 'Doe'
        assigns[:customer_results].values.should include 'John Doe, 22 Sharon Lane, TH78 6YH'
        assigns[:customer_results].values.should include 'Jane Doe, 22 Sharon Lane, TH78 6YH'
        assigns[:customer_results].values.size.should == 2
      end

      it "should be empty if there are no results" do
        post :search, :search_param => 'Ploppy poo pants'
        assigns[:customer_results].should_not be_nil
        assigns[:customer_results].should be_empty
      end
    end

    context "for product" do
      it "should set results" do
        post :search, :search_param => '5000'
        assigns[:product_results].should_not be_nil
      end

      it "should find product on code" do
        post :search, :search_param => '5000'
        assigns[:product_results].values.should include '5000, Becks Silver Zapper, Price: &pound;1.5, Weight: 10g'
      end
    end

  end

end
