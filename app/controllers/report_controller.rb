class ReportController < ApplicationController

  def generate_invoice

    order = Order.find params[:order]
    customer = Customer.find order.customer_id

    report = ODFReport::Report.new("#{File.expand_path(File.dirname(__FILE__))}/../../templates/receipt doc.odt") do |r|

      r.add_field "TITLE", customer.title
      r.add_field "FIRST NAME", customer.first_name
      r.add_field "SURNAME", customer.last_name

      r.add_field "ADDRESS 1", customer.address_line_1
      r.add_field "ADDRESS 2", customer.address_line_2
      r.add_field "ADDRESS 3", customer.address_line_3
      r.add_field "TOWN", customer.town
      r.add_field "POST CODE", customer.postcode
      r.add_field "COUNTRY", customer.country

      r.add_field "INVOICE NO", params[:order]
      r.add_field "ORDER DATE", order.order_date
      r.add_field "GRAND TOTAL", order.total_price
      r.add_field "DISCOUNT", order.discount


      r.add_table("Items", order.order_items, :header=>true) do |t|
        t.add_column('CODE', :product_code)
        t.add_column('QUANTITY', :quantity)
        t.add_column('PRODUCT', :product_name)
        t.add_column('UNIT PRICE', :unit_price)
        t.add_column('TOTAL', :items_price)
      end


    end

    report_file_name = report.generate

    send_file(report_file_name)

  end

end
