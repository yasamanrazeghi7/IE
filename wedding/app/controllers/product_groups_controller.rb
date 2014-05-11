class ProductGroupsController < ApplicationController
  before_action :set_product_group, only: [:show, :edit, :update, :destroy]
  # GET /product_groups
  # GET /product_groups.json
  def index
    @product_groups = ProductGroup.all
  end

  # GET /product_groups/1
  # GET /product_groups/1.json

  def show
    @pros = ProductGroup.find_products(params[:name])
    @brand = params[:name] 

  end

  # GET /product_groups/new
  def new
    @product_group = ProductGroup.new
  end

  # GET /product_groups/1/edit
  def edit
  end

  # POST /product_groups
  # POST /product_groups.json
  def create
    @product_group = ProductGroup.new(product_group_params)

    respond_to do |format|
      if @product_group.save
        format.html { redirect_to @product_group, notice: 'Product group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @product_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_groups/1
  # PATCH/PUT /product_groups/1.json
  def update
    respond_to do |format|
      if @product_group.update(product_group_params)
        format.html { redirect_to @product_group, notice: 'Product group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_groups/1
  # DELETE /product_groups/1.json
  def destroy
    @product_group.destroy
    respond_to do |format|
      format.html { redirect_to product_groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    #mozhdeh comment karde :(
    def set_product_group
      #@product_group = ProductGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_group_params
      params[:product_group]
    end
end
