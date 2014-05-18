class SchedulersController < ApplicationController
 
before_action :set_scheduler, only: [:show, :edit, :update, :destroy]

  # GET /schedulers
  # GET /schedulers.json
  def index
    @schedulers = Scheduler.all
  end

  # GET /schedulers/1
  # GET /schedulers/1.json
  def show
    @items = Item.where(:scheduler_id => params[:id])
    s_id = Scheduler.where(:user_id => current_user.id).first.id
    @scheduler = Scheduler.find(params[:id])
    if s_id.to_s != params[:id].to_s
     redirect_to :root, :notice => 'دسترسی به این صفحه برای شما امکان‌پذیر نیست'
    end
  end

  # GET /schedulers/new
  def new
    @scheduler = Scheduler.new
  end

  # GET /schedulers/1/edit
  def edit
  end

  # POST /schedulers
  # POST /schedulers.json
  def create
    @scheduler = Scheduler.new(scheduler_params)

    respond_to do |format|
      if @scheduler.save
        format.html { redirect_to @scheduler, notice: 'Scheduler was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scheduler }
      else
        format.html { render action: 'new' }
        format.json { render json: @scheduler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedulers/1
  # PATCH/PUT /schedulers/1.json
  def update
    respond_to do |format|
      if @scheduler.update(scheduler_params)
        format.html { redirect_to @scheduler, notice: 'Scheduler was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scheduler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedulers/1
  # DELETE /schedulers/1.json
  def destroy
    @scheduler.destroy
    respond_to do |format|
      format.html { redirect_to schedulers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduler
      @scheduler = Scheduler.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scheduler_params
      params.require(:Scheduler).permit(:totalost)
    end
end
