class CooperativesController < ApplicationController
  before_action :set_cooperative, only: %i[ show edit update destroy ]

  # GET /cooperatives or /cooperatives.json
  def index
    @cooperatives = Cooperative.all
  end

  # GET /cooperatives/1 or /cooperatives/1.json
  def show
  end

  def selected 
    @target = params[:target] 
    @branches = CooperativeBranch.where(cooperative_id: params[:id])
    respond_to do |format|
      format.turbo_stream
    end
  end

  # GET /cooperatives/new
  def new
    @cooperative = Cooperative.new
  end

  # GET /cooperatives/1/edit
  def edit
  end

  # POST /cooperatives or /cooperatives.json
  def create
    @cooperative = Cooperative.new(cooperative_params)

    respond_to do |format|
      if @cooperative.save
        format.html { redirect_to cooperative_url(@cooperative), notice: "Cooperative was successfully created." }
        format.json { render :show, status: :created, location: @cooperative }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cooperative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cooperatives/1 or /cooperatives/1.json
  def update
    respond_to do |format|
      if @cooperative.update(cooperative_params)
        format.html { redirect_to cooperative_url(@cooperative), notice: "Cooperative was successfully updated." }
        format.json { render :show, status: :ok, location: @cooperative }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cooperative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cooperatives/1 or /cooperatives/1.json
  def destroy
    @cooperative.destroy

    respond_to do |format|
      format.html { redirect_to cooperatives_url, notice: "Cooperative was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cooperative
      @cooperative = Cooperative.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cooperative_params
      params.require(:cooperative).permit(:name, :address, :abbreviation, :region)
    end
end
