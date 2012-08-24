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
    end
  end

end
