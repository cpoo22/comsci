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

  it "post search should " do
    FactoryGirl.create(:customer)
    post :search, :search_param => 'doe'
    assigns[:results].should_not be_nil
    assigns[:results].should == ["John Doe"]
  end

end
