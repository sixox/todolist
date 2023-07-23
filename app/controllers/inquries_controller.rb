class InquriesController < ApplicationController
  before_action :set_inqury, only: %i[ show edit update destroy ]

  # GET /inquries or /inquries.json
  def index
    @inquries = Inqury.all
  end

  # GET /inquries/1 or /inquries/1.json
  def show
  end

  # GET /inquries/new
  def new
    @inqury = Inqury.new
  end

  # GET /inquries/1/edit
  def edit
  end

  # POST /inquries or /inquries.json
  def create
    @inqury = Inqury.new(inqury_params)

    respond_to do |format|
      if @inqury.save
        format.html { redirect_to inqury_url(@inqury), notice: "Inqury was successfully created." }
        format.json { render :show, status: :created, location: @inqury }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inqury.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inquries/1 or /inquries/1.json
  def update
    respond_to do |format|
      if @inqury.update(inqury_params)
        format.html { redirect_to inqury_url(@inqury), notice: "Inqury was successfully updated." }
        format.json { render :show, status: :ok, location: @inqury }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inqury.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inquries/1 or /inquries/1.json
  def destroy
    @inqury.destroy

    respond_to do |format|
      format.html { redirect_to inquries_url, notice: "Inqury was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inqury
      @inqury = Inqury.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inqury_params
      params.require(:inqury).permit(:full_name, :email, :phone, :company, :product, :quantity, :country, :port, :packing)
    end
end
