class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_side, only: %i[ show index applications news articles ]

  # GET /posts or /posts.json
  def index
    @latest_articles = Post.where.not(kind: 'news').order(created_at: :desc)
  end

  # GET /posts/1 or /posts/1.json
  def show  
    @latest_articles = Post.where.not(kind: 'news').order(created_at: :desc)
  end

  def applications
    @latest_articles = Post.where(kind: 'application').order(created_at: :desc)
    render "index"
  end

  def news
    @latest_articles = Post.where(kind: 'news').order(created_at: :desc)
    render "index"
  end

  def articles
    @latest_articles = Post.where.not(kind: 'news').order(created_at: :desc)
    render "index"
  end

  # GET /posts/new
  def new
    @post = Post.new
    @products = Product.all
    @post.build_seo_tag

  end

  # GET /posts/1/edit
  def edit
    @products = Product.all
    @post.build_seo_tag if @post.seo_tag.nil?

  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def redirect_to_slug
    post = Post.find(params[:id])
    redirect_to post_path(post), status: :moved_permanently
  rescue ActiveRecord::RecordNotFound
    # Handle the case where the post does not exist.
    redirect_to posts_path, status: :moved_permanently
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def set_side
      @posts = Post.all
      @bread_path = posts_path
      @latest_news = Post.where(kind: 'news').order(created_at: :desc).limit(3)
      @application_posts = Post.where(kind: 'application')
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :kind, :category, :tag, :image, product_ids: [], seo_tag_attributes: [:title, :description, :keywords])
    end
end
