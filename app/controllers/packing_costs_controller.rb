
class PackingCostsController < ApplicationController
  # GET /packing_costs
  # GET /packing_costs.json
  def index
    @packing_costs = PackingCost.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @packing_costs }
    end
  end

  # GET /packing_costs/1
  # GET /packing_costs/1.json
  def show
    @packing_cost = PackingCost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @packing_cost }
    end
  end

  # GET /packing_costs/new
  # GET /packing_costs/new.json
  def new
    @packing_cost = PackingCost.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @packing_cost }
    end
  end

  # GET /packing_costs/1/edit
  def edit
    @packing_cost = PackingCost.find(params[:id])
  end

  # POST /packing_costs
  # POST /packing_costs.json
  def create
    @packing_cost = PackingCost.new(params[:packing_cost])

    respond_to do |format|
      if @packing_cost.save
        format.html { redirect_to @packing_cost, notice: 'Packing cost was successfully created.' }
        format.json { render json: @packing_cost, status: :created, location: @packing_cost }
      else
        format.html { render action: "new" }
        format.json { render json: @packing_cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /packing_costs/1
  # PUT /packing_costs/1.json
  def update
    @packing_cost = PackingCost.find(params[:id])

    respond_to do |format|
      if @packing_cost.update_attributes(params[:packing_cost])
        format.html { redirect_to @packing_cost, notice: 'Packing cost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @packing_cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packing_costs/1
  # DELETE /packing_costs/1.json
  def destroy
    @packing_cost = PackingCost.find(params[:id])
    @packing_cost.destroy

    respond_to do |format|
      format.html { redirect_to packing_costs_url }
      format.json { head :no_content }
    end
  end
end
