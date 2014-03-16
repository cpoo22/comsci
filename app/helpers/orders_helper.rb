module OrdersHelper

  def postage postal_type
    PostalCost.order("weight ASC").where("code = '#{postal_type}' and weight >= ?", @order.total_weight).first.cost
  end

end
