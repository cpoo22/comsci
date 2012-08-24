class PagesController < ApplicationController

  def search
    if request.post?
      @customer_results = {}
      customers = Customer.find_all_by_first_name(params[:search_param.downcase])
      customers.concat   Customer.find_all_by_last_name(params[:search_param.downcase])
      customers.concat   Customer.find_all_by_postcode(params[:search_param.downcase])
      customers.each do |customer|
        @customer_results[customer_path(customer)] =
            "#{customer.first_name} #{customer.last_name}, #{customer.address_line_1}, #{customer.postcode}"
      end
      @product_results = {}
      products = Product.find_all_by_code(params[:search_param.downcase])
      #products.concat   Customer.find_all_by_last_name(params[:search_param.downcase])
      #products.concat   Customer.find_all_by_postcode(params[:search_param.downcase])
      products.each do |product|
        @product_results[product_path(product)] =
            "#{product.code}, #{product.name}, Price: &pound;#{product.price}, Weight: #{product.weight}g"
      end
    end
  end

end
