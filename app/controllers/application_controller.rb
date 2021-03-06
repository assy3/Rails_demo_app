class ApplicationController < ActionController::Base
	# 全てのコントローラー/アクションに有効
	before_action :set_current_user
  # before_action :authenticate_user
	def set_current_user
		@current_user = User.find_by(id: session[:user_id])
	end

	# 未ログインユーザーを制限
	def authenticate_user
		if @current_user == nil
			flash[:notice] = "ログインが必要です"
			redirect_to("/login")
		end
	end

	# ログインユーザーを制限
	def forbid_login_user
		if @current_user
			flash[:notice] = "すでにログインしています"
			redirect_to("/posts/index")
		end
	end

end
