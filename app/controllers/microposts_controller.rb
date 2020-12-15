class MicropostsController < ApplicationController
  before_action :correct_user,   only: :destroy
  def index
    @microposts = Micropost.all
    render json: @microposts
  end

  def show
    @micropost = Micropost.find(params[:id])
    render json: @micropost
  end

  def create
    @micropost = current_user.microposts.new(micropost_params)
    if @micropost.save
      render json: micropost, status: :created
    else
      render json: { errors: micropost.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(micropost_params)
      head :no_content
    else
      render json: { errors: micropost.errors.full_messages }, status: :unprocessable_entity
    end
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
