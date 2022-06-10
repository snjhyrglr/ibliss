class InsuredsController < ApplicationController
  before_action :set_insured, only: %i[ show edit update destroy ]

  # GET /insureds or /insureds.json
  def index
    @insureds = Insured.all
  end

  # GET /insureds/1 or /insureds/1.json
  def show
  end

  def import 
    Insured.import(params[:file])
    flash[:success] = "Article was created successfully."
    redirect_to insureds_path
  end

  # GET /insureds/new
  def new
    @insured = Insured.new
  end

  # GET /insureds/1/edit
  def edit
  end

  # POST /insureds or /insureds.json
  def create
    @insured = Insured.new(insured_params)

    respond_to do |format|
      if @insured.save
        format.html { redirect_to insured_url(@insured), notice: "Insured was successfully created." }
        format.json { render :show, status: :created, location: @insured }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @insured.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insureds/1 or /insureds/1.json
  def update
    respond_to do |format|
      if @insured.update(insured_params)
        format.html { redirect_to insured_url(@insured), notice: "Insured was successfully updated." }
        format.json { render :show, status: :ok, location: @insured }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @insured.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insureds/1 or /insureds/1.json
  def destroy
    @insured.destroy

    respond_to do |format|
      format.html { redirect_to insureds_url, notice: "Insured was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insured
      @insured = Insured.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def insured_params
      params.require(:insured).permit(:cooperative_id, :cooperative_branch_id, :last_name, :first_name, :middle_name, :suffix, :birthdate, :gender, :age, :civil_status, :place_of_birth, :id_type, :id_no, :TIN_no, :nationality, :address, :premium, :height, :weight, :contact_no, :source_of_income, :business_address, :tel_no, :member_since,
      beneficiaries_attributes: [:id, :insured_id, :name, :date_of_birth, :relationship, :_destroy],
      dependents_attributes: [:id, :insured_id, :name, :date_of_birth, :relationship, :_destroy])
    end
end
