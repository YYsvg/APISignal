class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    if @post.save
      CreateNotification.call(
      contents: { 'en' => 'Post created!', 'ja' => 'ポストが作成されました！' },
      type: 'posts#create'
    )
    redirect_to @post, notice: 'Post was successfully created.'
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    
    if @post.update(post_params)
      CreateNotification.call(
      contents: { 'en' => 'Post updated!', 'ja' => 'ポストが更新されました！' },
      type: 'posts#update'
      )
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
    CreateNotification.call(
    contents: { 'en' => 'Post destroyed!', 'ja' => 'ポストが削除されました！' },
    type: 'posts#destroy'
  )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
