class PostsController < ApplicationController
  # postsコントローラーにログイン制限
  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    # @user = User.find_by(id: @post.user_id)
    @user = @post.user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id
    )

    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
      # redirect_to("/posts/#{@post.id}/edit")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    # updateアクションの中身を作成してください
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]

    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
      # redirect_to("/posts/#{@post.id}/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

  # 他人の情報を編集できないようにする
  def ensure_correct_user
      # ログイン中のユーザーとidと編集したいユーザーidが等しくない場合
      @post = Post.find_by(id: params[:id])
      if @post.user_id != @current_user.id
        flash[:notice] = "権限がありません"
        redirect_to("/posts/index")
      end
  end

end
