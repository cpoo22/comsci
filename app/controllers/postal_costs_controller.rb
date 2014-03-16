
class PostalCostsController < ApplicationController
  # GET /postal_costs
  # GET /postal_costs.json
  def index
    @postal_costs = PostalCost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @postal_costs }
    end
  end

  # GET /postal_costs/1
  # GET /postal_costs/1.json
  def show
    @postal_cost = PostalCost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @postal_cost }
    end
  end

  # GET /postal_costs/new
  # GET /postal_costs/new.json
  def new
    @postal_cost = PostalCost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @postal_cost }
    end
  end

  # GET /postal_costs/1/edit
  def edit
    @postal_cost = PostalCost.find(params[:id])
  end

  # POST /postal_costs
  # POST /postal_costs.json
  def create
    @postal_cost = PostalCost.new(params[:postal_cost])

    respond_to do |format|
      if @postal_cost.save
        format.html { redirect_to @postal_cost, notice: 'Postal cost was successfully created.' }
        format.json { render json: @postal_cost, status: :created, location: @postal_cost }
      else
        format.html { render action: "new" }
        format.json { render json: @postal_cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /postal_costs/1
  # PUT /postal_costs/1.json
  def update
    @postal_cost = PostalCost.find(params[:id])

    respond_to do |format|
      if @postal_cost.update_attributes(params[:postal_cost])
        format.html { redirect_to @postal_cost, notice: 'Postal cost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @postal_cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postal_costs/1
  # DELETE /postal_costs/1.json
  def destroy
    @postal_cost = PostalCost.find(params[:id])
    @postal_cost.destroy

    respond_to do |format|
      format.html { redirect_to postal_costs_url }
      format.json { head :no_content }
    end
  end
end
