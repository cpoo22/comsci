require 'spec_helper'


describe ProductsController do
  render_views

  before(:each) do
    FactoryGirl.create(:product)
  end

  it "index action should render index template" do
    get :index
    response.should be_success
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Product.first
    response.should be_success
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should be_success
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Product.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should be_success
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Product.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should be_redirect
    response.should redirect_to(product_url(assigns[:product]))
  end

  it "should create a product" do
    Product.any_instance.stubs(:valid?).returns(true)
    expect {
      post :create
    }.to change(Product, :count).by 1
  end

  it "edit action should render edit template" do
    get :edit, :id => Product.first
    response.should be_success
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Product.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Product.first
    response.should be_success
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Product.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Product.first
    response.should be_redirect
    response.should redirect_to(product_url(assigns[:product]))
  end

  it "destroy action should destroy model and redirect to index action" do
    product = Product.first
    delete :destroy, :id => product
    response.should be_redirect
    response.should redirect_to(products_url)
    Product.exists?(product.id).should be_false
  end
end
