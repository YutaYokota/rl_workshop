class MicropostsController < ApplicationController
  before_action :correct_user,   only: :destroy
  def index
    @microposts = Microposts.all
  end

  def show
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      #投稿成功時の処理
    else
      #投稿失敗時の処理
    end
  end

  def update
  end

  def destroy
    @micropost.destroy
    #削除メッセージの表示
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content, :anonymous, :reply_to, :reply_user, :posted_at)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

end
