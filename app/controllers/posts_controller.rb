class PostsController < ApplicationController
  def index
    # viewで定義していた配列postsを@postsという変数名で定義してください
    # @posts =
    # [
    #   "今日からProgateでRailsの勉強するよー！",
    #   "投稿一覧ページ作成中！",
    #   "今日からProgateでRailsの勉強するよー！",
    #   "投稿一覧ページ作成中！",
    #   "おえんじゅん"
    # ]
    # @posts = Post.all
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    # @id = params[:id]
    @post = Post.find_by(id: params[:id])
  end

  def new
  end

  def create
    # フォームから送信されたデータを受け取り、保存する処理を追加してください
    @post = Post.new(content: params[:content])
    @post.save
    redirect_to("/posts/index")
  end

end
