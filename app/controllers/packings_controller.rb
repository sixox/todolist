class PackingsController < ApplicationController
  before_action :set_packing, only: %i[ show edit update destroy ]

  # GET /packings or /packings.json
  def index
    @packings = Packing.all
  end

  # GET /packings/1 or /packings/1.json
  def show
  end

  # GET /packings/new
  def new
    @packing = Packing.new
    @products = Product.all
    @packing.build_seo_tag

  end

  # GET /packings/1/edit
  def edit
    @products = Product.all
    @packing.build_seo_tag if @packing.seo_tag.nil?


  end

  # POST /packings or /packings.json
  def create
    @packing = Packing.new(packing_params)

    respond_to do |format|
      if @packing.save
        format.html { redirect_to packing_url(@packing), notice: "Packing was successfully created." }
        format.json { render :show, status: :created, location: @packing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @packing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packings/1 or /packings/1.json
  def update
    respond_to do |format|
      if @packing.update(packing_params)
        format.html { redirect_to packing_url(@packing), notice: "Packing was successfully updated." }
        format.json { render :show, status: :ok, location: @packing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @packing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packings/1 or /packings/1.json
  def destroy
    @packing.destroy

    respond_to do |format|
      format.html { redirect_to packings_url, notice: "Packing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def redirect_to_slug
    puts "Redirecting to slug"
    packing = Packing.find(params[:id])
    redirect_to packing_path(packing), status: :moved_permanently
  rescue ActiveRecord::RecordNotFound
    redirect_to packings_path, status: :moved_permanently
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_packing
      @packing = Packing.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def packing_params
      params.require(:packing).permit(:name, :description, :content, :specification, product_ids: [], seo_tag_attributes: [:title, :description, :keywords])
    end
end
