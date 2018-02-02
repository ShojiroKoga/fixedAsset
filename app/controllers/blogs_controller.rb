class BlogsController < ApplicationController
before_action :set_blog, only: [:show, :edit, :update, :destroy]
  
  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    
    @blog = Blog.new(blog_params)
    
    @blog.image.retrieve_from_cache! params[:cache][:image]
    
    @blog.user_id = current_user.id
    if @blog.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
     # CreateMailer.create_mail(current_user.email).deliver
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
    

    
    
  end
  
  def show
    # 追記する
   # @blog = Blog.find(params[:id])
   @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
  
  def edit
  #  @blog = Blog.find(params[:id])
  end
  
  def update
    #@blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  def confirm
    @blog = Blog.new(blog_params)
    
    @blog.image.cache! unless @blog.image.blank?
    
    render :new if @blog.invalid?
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :content, :image, :image_cache)
    end

    # idをキーとして値を取得するメソッド
    def set_blog
      @blog = Blog.find(params[:id])
    end
end