class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @packings = Packing.all
    @applications = Post.where(kind: 'application').order(created_at: :desc)
    @product.build_seo_tag


  end

  # GET /products/1/edit
  def edit
    @packings = Packing.all
    @applications = Post.where(kind: 'application').order(created_at: :desc)
    @product.build_seo_tag if @product.seo_tag.nil?

  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def redirect_to_slug
    product = Product.find(params[:id])
    redirect_to product_path(product), status: :moved_permanently
  rescue ActiveRecord::RecordNotFound
    # Handle the case where the product does not exist.
    redirect_to products_path, status: :moved_permanently
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :content, packing_ids: [], post_ids: [], seo_tag_attributes: [:title, :description, :keywords])
    end
end
