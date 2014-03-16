class PagesController < ApplicationController

  def search
    if request.post?
      @customer_results = {}
      customers = Customer.where("lower(first_name) = ?", params[:search_param.downcase])
      customers.concat Customer.where("lower(last_name) = ?", params[:search_param.downcase])
      customers.concat Customer.where("lower(postcode) = ?", params[:search_param.downcase])
      customers.concat Customer.where("telephone_number = ?",params[:search_param])
      customers.each do |customer|
        @customer_results[customer_path(customer)] =
            "#{customer.first_name} #{customer.last_name}, #{customer.address_line_1}, #{customer.postcode}"
      end
      @product_results = {}
      products = Product.find_all_by_code(params[:search_param.downcase])
      products.concat Product.find_by_sql("select * from products where name like '%#{params[:search_param.downcase]}%'")
      products.each do |product|
        @product_results[product_path(product)] =
            "#{product.code}, #{product.name}, Price: £#{product.price}, Weight: #{product.weight}g"
      end
    end
  end

  def index
  end

end
